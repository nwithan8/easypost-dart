import 'dart:convert';

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/client_configuration.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/http/streamed_response.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_credit_card.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/exceptions/api/api_exception.dart';
import 'package:easypost/src/exceptions/json/json_deserialization_exception.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
import 'package:easypost/src/models/api_key.dart';
import 'package:http/http.dart' as http;

/// The [ExtrasService] handles extraneous EasyPost API functionality.
/// These methods are not directly related to any other service and are not intended for end-user use.
class ExtrasService extends Service {
  ExtrasService(Client client) : super(client);

  Future<int?> lookupUspsZone(int fromZip, int toZip) async {
    final Map<String, dynamic> parameters = {
      'from': fromZip,
      'to': toZip,
    };

    final Map<String, dynamic> json = await client.requestJson(
        HttpMethod.get, 'usps_zones', ApiVersion.v2,
        parameters: parameters);

    String jsonKey = "usps_zone";

    if (json.containsKey(jsonKey)) {
      return json[jsonKey];
    } else {
      return null;
    }
  }

  /// Retrieve EasyPost's public Stripe API key.
  Future<String> retrieveStripeApiKey() async {
    // FIXME: Is this endpoint accessible via referral user production API key, or only by parent user?
    final Map<String, dynamic> json = await client.requestJson(
        HttpMethod.get, 'partners/stripe_public_key', ApiVersion.v2);

    String jsonKey = "public_key";

    if (json.containsKey(jsonKey)) {
      return json[jsonKey];
    } else {
      throw JsonDeserializationException.generate("Stripe API key unavailable");
    }
  }

  /// Create a Stripe token for a credit card.
  Future<String> createStripeToken(String stripeApiKey, int number,
      int expirationMonth, int expirationYear, int cvc) async {
    Uri uri = Uri.parse("https://api.stripe.com/v1/tokens");

    // Create a temporary HTTP client to make the request
    http.Client httpClient = http.Client();

    // Create the request
    final http.Request request = http.Request(HttpMethod.post.value, uri);

    // Add the headers
    request.headers['Accept'] = 'application/x-www-form-urlencoded';
    request.headers['Authorization'] = 'Bearer $stripeApiKey';

    // Add the body
    request.body =
        "card[number]=$number&card[exp_month]=$expirationMonth&card[exp_year]=$expirationYear&card[cvc]=$cvc";

    // Send the request
    final streamedResponse = await httpClient.send(request);

    final response = await http.Response.fromStream(streamedResponse);

    final Map<String, dynamic> json = jsonDecode(response.body);

    String jsonKey = "id";

    if (json.containsKey(jsonKey)) {
      return json[jsonKey];
    } else {
      throw JsonDeserializationException("$jsonKey not found in JSON response");
    }
  }

  Future<Map<String, dynamic>>
      createParametersToAddCreditCardToEasyPostViaStripe(
          AddCreditCard parameters,
          {PaymentMethodPriority? priority}) async {
    priority ??= PaymentMethodPriority.primary;
    // Validate the parameters before we begin
    // Will raise an exception if any required parameters are missing
    parameters.validate();

    // Retrieve the Stripe public key
    String stripePublicKey;
    try {
      stripePublicKey = await retrieveStripeApiKey();
    } catch (e) {
      throw ResourceNotFoundException(
          "Unable to retrieve EasyPost's Stripe API key.");
    }

    // Create a Stripe token for the credit card
    String stripeToken;
    try {
      stripeToken = await createStripeToken(
        stripePublicKey,
        parameters.creditCardNumber!,
        parameters.creditCardExpirationMonth!,
        parameters.creditCardExpirationYear!,
        parameters.creditCardCvv!,
      );
    } catch (e) {
      throw Exception(
          "Could not send card details to Stripe, please try again later.");
    }

    Map<String, dynamic> parameterMap = {
      'credit_card': {
        'stripe_object_id': stripeToken,
        'priority': priority.toString()
      }
    };

    return parameterMap;
  }

  Client createClientWithReferralCustomerApiKey(String referralCustomerApiKey) {
    return Client(ClientConfiguration("none", referralCustomerApiKey,
        apiVersion: client.config.apiVersion, baseUrl: client.config.baseUrl));
  }

  static Future<http.Response> _rawEasyPostRequest(
      HttpMethod method, String url,
      {Map<String, dynamic>? parameters,
      Map<String, String>? additionalHeaders}) async {
    final uri = Uri.parse(url);
    final request = http.Request(method.value, uri);

    final defaultHeaders = {
      "authority": "www.easypost.com",
      "accept": "application/json",
      "content-type": "application/json",
      "origin": "https://www.easypost.com",
      "user-agent": ClientConfiguration.getUserAgent(ApiVersion.v2),
    };
    if (additionalHeaders != null) {
      defaultHeaders.addAll(additionalHeaders);
    }

    request.headers.addAll(defaultHeaders);

    // Add body to a POST/PUT/PATCH request
    if (parameters != null &&
        (method == HttpMethod.post ||
            method == HttpMethod.put ||
            method == HttpMethod.patch)) {
      request.body = jsonEncode(parameters);
    }

    final streamedResponse = await http.Client().send(request);

    if (streamedResponse.isError) {
      // request returned an error, throw the appropriate exception
      throw await ApiException.fromStreamedResponse(streamedResponse);
    }

    return await http.Response.fromStream(streamedResponse);
  }

  static Future<String> logInWithEmailAndPasswordReturnAuthCookie(
      String email, String password) async {
    const String uri = "https://www.easypost.com/web_api/v1/sessions";
    final method = HttpMethod.post;

    final headers = {
      "referer": "https://www.easypost.com/login",
    };

    const String gCaptchaResponse =
        "03AFcWeA7dJsElDmsUtYYgPZxLZvFTOmVd4O-G0S8ApVvFw61NF6KcUlZoOjteblszCbjp3YEoCv6WC08xKKk6riWY5sQbAt4N1nvlpQw2OpNFMrfe4dLxrZXI3wbyLM4eNmCvP69anny4hqSolrWM6zBZrb2JdFct76fZAaXhu6zGZE4kFBBCIpgJjSMdSTpRGp9milHTisy_Z7nhSe5Un8VpibuvPVYmxTHpQQHTsOb9DEArUGI8WuiW21j0E4NqlMaVuH1Z0tJP8_i8D6WzmNpY3fYp-fEqDMVhxgATysAe4DQvxUw6elYV6ukeo8NHb8mw6oN4Vay1MgxrDRNUpIktCkkmtEngKy-SNEMtuP_k4H2jKbsAhbKyRuyA4yQycEPMmOlkc8KHiNtHPyr0RXEqAArsO0yhseWYXwpRyhVmHhbBHvVJDSWr9ot2PXBwKvsj8O-OqhTP0h6ImWp3Vf8c8gqC4UiScYNn0pnjdBggmXlIkEC0lE7NzGTKbXJpYLNqxZ4uUiZN-zTCL_CEiQs1GlaoAY2-huwF3hnw-o-l5Ilq_43etiZ7QZnFmTNwVVzClX4PcgFtHIbxMjT7nLe_8v_27cScXqVGUCw6sS6mwCjY2unEySDdomRbbTl_bnltmPyijpDYN18hFvdWI1EH967IYuu95w";

    Map<String, dynamic> bodyData = {
      "session": {
        "email": email,
        "password": password,
        "g-recaptcha-response": gCaptchaResponse,
      }
    };

    final response = await _rawEasyPostRequest(method, uri,
        parameters: bodyData, additionalHeaders: headers);

    String cookies = response.headers['set-cookie']!;

    const String authCookieName = "easy_post_web_session=";

    List<String> cookieList = cookies.split(";");
    return cookieList.firstWhere((element) => element.contains(authCookieName));
  }

  /// Use the given authentication cookie to collect the user's API keys from easypost.com.
  /// Returns an [ApiKeyPair] containing the user's test API key and production API key.
  static Future<ApiKeyPair> getApiKeysUsingCookie(String cookie) async {
    const String url =
        "https://www.easypost.com/api/v2/api_keys?exclude_children=true";
    final method = HttpMethod.get;
    final headers = {
      "cookie": cookie,
    };

    final response =
        await _rawEasyPostRequest(method, url, additionalHeaders: headers);
    var jsonData = jsonDecode(response.body);

    return ApiKeyPair.fromWebAuthResponse(jsonData);
  }
}

class ApiKeyPair {
  final ApiKey? testApiKey;
  final ApiKey? productionApiKey;

  String? get testKey => testApiKey?.key;

  String? get productionKey => productionApiKey?.key;

  static ApiKey? _extractApiKeyFromApiKeysList(
      List<ApiKey> apiKeys, String mode) {
    return apiKeys.firstWhere((key) => key.mode == mode);
  }

  ApiKeyPair(this.testApiKey, this.productionApiKey);

  static ApiKeyPair fromWebAuthResponse(Map<String, dynamic> json) {
    var keysData = json['keys'];
    List<ApiKey> keys = List<ApiKey>.empty(growable: true);
    for (var keyData in keysData) {
      var key = ApiKey.fromJson(keyData);
      keys.add(key);
    }

    var testApiKey = _extractApiKeyFromApiKeysList(keys, "test");
    var productionApiKey = _extractApiKeyFromApiKeysList(keys, "production");

    return ApiKeyPair(testApiKey, productionApiKey);
  }
}

import 'dart:convert';

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/client_configuration.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/extras.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/json/json_deserialization_exception.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_method_priority.dart';
import 'package:http/http.dart' as http;

/// The [ExtrasService] handles extraneous EasyPost API functionality.
/// These methods are not directly related to any other service and are not intended for end-user use.
class ExtrasService extends Service {
  ExtrasService(Client client) : super(client);

  /// Retrieve EasyPost's public Stripe API key.
  Future<String> retrieveStripeApiKey() async {
    final Map<String, dynamic> json = await client.requestJson(
        HttpMethod.get, 'partners/stripe_public_key', ApiVersion.v2);

    String jsonKey = "public_key";

    if (json.containsKey(jsonKey)) {
      return json[jsonKey];
    } else {
      throw JsonDeserializationException("$jsonKey not found in JSON response");
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
      throw Exception("$jsonKey not found in JSON response");
    }
  }

  /// Store a Stripe token for a credit card on a [ReferralCustomer]'s account.
  Future<PaymentMethod> createEasyPostCreditCardUsingStripeToken(
      String referralCustomerApiKey, String stripeToken,
      {PaymentMethodPriority? priority = PaymentMethodPriority.primary}) async {
    // Create a one-off Client clone configured with the referral customer's API key
    Client referralClient = Client(ClientConfiguration(referralCustomerApiKey,
        apiVersion: client.config.apiVersion, baseUrl: client.config.baseUrl));

    // Create the request parameters
    CreateCreditCard parameters = CreateCreditCard();
    parameters.stripeToken = stripeToken;
    parameters.priority = priority;

    // Convert parameters to JSON
    Map<String, dynamic> parametersMap =
        parameters.constructJson(client: referralClient);

    // Send the request
    final json = await referralClient.requestJson(
        HttpMethod.post, 'credit_cards', ApiVersion.v2,
        parameters: parametersMap);

    // Deserialize the response JSON
    return PaymentMethod.fromJson(json);
  }
}

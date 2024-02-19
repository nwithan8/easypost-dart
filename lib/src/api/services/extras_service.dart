import 'dart:convert';

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/client_configuration.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_credit_card.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/exceptions/json/json_deserialization_exception.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
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
}

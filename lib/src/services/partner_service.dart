import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/referral_customer.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_method_priority.dart';
import 'package:easypost/src/parameters/referral_customers.dart';
import 'package:easypost/src/services/extras_service.dart';

import '../http/api_version.dart';
import '../http/http_method.dart';

/// The [PartnerService] handles white-label partner-related requests with the EasyPost API.
class PartnerService extends Service {
  PartnerService(Client client) : super(client);

  /// Creates a [ReferralCustomer].
  Future<ReferralCustomer> createReferralCustomer(
      ReferralCustomersCreate parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'referral_customers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [ReferralCustomer] by its ID.
  Future<ReferralCustomer> retrieveReferralCustomer(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'referral_customers/$id',
      ApiVersion.v2,
    );
  }

  /// Retrieves all [ReferralCustomer]s.
  Future<ReferralCustomerCollection> retrieveAllReferralCustomers(
      ReferralCustomersAll parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.get,
      'referral_customers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Add a credit card to a [ReferralCustomer]'s account.
  Future<PaymentMethod> addCreditCardToReferralCustomer(
      String referralCustomerApiKey, ReferralCustomersAddCreditCard parameters,
      {PaymentMethodPriority? priority = PaymentMethodPriority.primary}) async {
    // Validate the parameters before we begin
    // Will raise an exception if any required parameters are missing
    parameters.validate();

    // Create a one-off ExtrasService to use for this function
    ExtrasService extrasService = ExtrasService(client);

    String stripePublicKey;
    try {
      stripePublicKey = await extrasService.retrieveStripeApiKey();
    } catch (e) {
      throw Exception("Unable to retrieve EasyPost's Stripe API key.");
    }

    String stripeToken;
    try {
      stripeToken = await extrasService.createStripeToken(
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

    return extrasService.createEasyPostCreditCardUsingStripeToken(
        referralCustomerApiKey, stripeToken,
        priority: priority);
  }

  /// Update a [ReferralCustomer]'s email address.
  Future<bool> updateReferralCustomerEmail(ReferralCustomer referralCustomer,
      ReferralCustomersUpdateEmail parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.request(HttpMethod.post,
        'referral_customers/${referralCustomer.id}', ApiVersion.v2,
        parameters: parameterMap);
  }
}

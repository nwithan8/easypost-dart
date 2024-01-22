import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/add_credit_card_to_referral_customer.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/list_referral_customers.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/create_referral_customer.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/update_referral_customer_email.dart';
import 'package:easypost/src/api/services/extras_service.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/models/referral_customer.dart';

/// The [PartnerService] handles white-label partner-related requests with the EasyPost API.
class PartnerService extends Service {
  PartnerService(Client client) : super(client);

  /// Creates a [ReferralCustomer].
  Future<ReferralCustomer> createReferralCustomer(
      CreateReferralCustomer parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'referral_customers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return ReferralCustomer.fromJson(json);
  }

  /// Retrieves a [ReferralCustomer] by its ID.
  Future<ReferralCustomer> retrieveReferralCustomer(String id) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'referral_customers/$id',
      ApiVersion.v2,
    );
    return ReferralCustomer.fromJson(json);
  }

  /// Retrieves all [ReferralCustomer]s.
  Future<ReferralCustomerCollection> listReferralCustomers(
      ListReferralCustomers parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.get,
      'referral_customers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return ReferralCustomerCollection.fromJson(json);
  }

  /// Add a credit card to a [ReferralCustomer]'s account.
  Future<PaymentMethod> addCreditCardToReferralCustomer(
      String referralCustomerApiKey, AddCreditCardToReferralCustomer parameters,
      {PaymentMethodPriority? priority}) async {
    priority ??= PaymentMethodPriority.primary;
    // Validate the parameters before we begin
    // Will raise an exception if any required parameters are missing
    parameters.validate();

    // Create a one-off ExtrasService to use for this function
    ExtrasService extrasService = ExtrasService(client);

    String stripePublicKey;
    try {
      stripePublicKey = await extrasService.retrieveStripeApiKey();
    } catch (e) {
      throw ResourceNotFoundException(
          "Unable to retrieve EasyPost's Stripe API key.");
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
      UpdateReferralCustomerEmail parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.request(HttpMethod.post,
        'referral_customers/${referralCustomer.id}', ApiVersion.v2,
        parameters: parameterMap);
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_credit_card.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_existing_stripe_payment_method.dart';
import 'package:easypost/src/api/parameters/v2/billing/issue_refund.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/create_referral_customer.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/list_referral_customers.dart';
import 'package:easypost/src/api/parameters/v2/referral_customers/update_referral_customer_email.dart';
import 'package:easypost/src/api/services/billing_service.dart';
import 'package:easypost/src/api/services/extras_service.dart';
import 'package:easypost/src/api/services/referral_customer_service.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_refund.dart';
import 'package:easypost/src/models/referral_customer.dart';

/// The [PartnerService] handles white-label partner-related requests with the EasyPost API.
/// This service should be used by a client configured with the partner's API key.
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
  Future<ReferralCustomer> retrieveReferralCustomer(String referralCustomerId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'referral_customers/$referralCustomerId',
      ApiVersion.v2,
    );
    return ReferralCustomer.fromJson(json);
  }

  /// Retrieves all [ReferralCustomer]s.
  Future<ReferralCustomerCollection> listReferralCustomers(
      {ListReferralCustomers? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.get,
      'referral_customers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    final collection = ReferralCustomerCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [ReferralCustomerCollection].
  Future<ReferralCustomerCollection> getNextPageOfReferralCustomers(
      ReferralCustomerCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListReferralCustomers? parameters) {
      return listReferralCustomers(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.referralCustomers,
        pageSize: pageSize) as Future<ReferralCustomerCollection>;
  }

  /// Update a [ReferralCustomer]'s email address.
  Future<bool> updateReferralCustomerEmail(
      String referralCustomerId, UpdateReferralCustomerEmail parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.request(
        HttpMethod.put, 'referral_customers/$referralCustomerId', ApiVersion.v2,
        parameters: parameterMap);
  }

  /// Add a credit card to a [ReferralCustomer]'s account.
  Future<PaymentMethod> addCreditCardToReferralCustomer(
      String referralCustomerApiKey, AddCreditCard parameters,
      {PaymentMethodPriority? priority}) async {
    // Create a one-off Client clone configured with the referral customer's production API key
    ExtrasService extrasService = ExtrasService(client);
    Client referralClient = extrasService
        .createClientWithReferralCustomerApiKey(referralCustomerApiKey);
    referralClient.enableProductionMode();

    // Create a one-off BillingService instance with the referral client
    BillingService billingService = BillingService(referralClient);
    return billingService.addCreditCard(parameters, priority: priority);
  }

  /// Add an existing Stripe payment method to a [ReferralCustomer]'s account.
  Future<PaymentMethod> addExistingStripePaymentMethodToReferralCustomer(
      String referralCustomerApiKey,
      AddExistingStripePaymentMethod parameters) async {
    // Create a one-off Client clone configured with the referral customer's production API key
    ExtrasService extrasService = ExtrasService(client);
    Client referralClient = extrasService
        .createClientWithReferralCustomerApiKey(referralCustomerApiKey);
    referralClient.enableProductionMode();

    // Create a one-off ReferralCustomerService instance with the referral client
    ReferralCustomerService referralCustomerService =
        ReferralCustomerService(referralClient);
    return referralCustomerService.addExistingStripePaymentMethod(parameters);
  }

  /// Refund a [ReferralCustomer]'s account by either a specific amount or a specific payment log entry.
  /// Refund will be issued to the user's original payment method.
  Future<PaymentRefund> issueRefundToReferralCustomerAccount(
      String referralCustomerApiKey, IssueRefund parameters) async {
    // Create a one-off Client clone configured with the referral customer's production API key
    ExtrasService extrasService = ExtrasService(client);
    Client referralClient = extrasService
        .createClientWithReferralCustomerApiKey(referralCustomerApiKey);
    referralClient.enableProductionMode();

    // Create a one-off ReferralCustomerService instance with the referral client
    ReferralCustomerService referralCustomerService =
        ReferralCustomerService(referralClient);
    return referralCustomerService.issueRefund(parameters);
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_bank_account.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_credit_card.dart';
import 'package:easypost/src/api/parameters/v2/billing/add_plaid_bank_account.dart';
import 'package:easypost/src/api/parameters/v2/billing/fund_wallet.dart';
import 'package:easypost/src/api/parameters/v2/billing/list_payment_logs.dart';
import 'package:easypost/src/api/services/extras_service.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/constants.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/exceptions/payment_methods_not_initialized_exception.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
import 'package:easypost/src/models/payment_log.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_methods_summary.dart';

/// The [BillingService] handles billing with the EasyPost API.
class BillingService extends Service {
  BillingService(Client client) : super(client);

  /// Retrieves all payment methods via a [PaymentMethodsSummary].
  Future<PaymentMethodsSummary> retrievePaymentMethods() async {
    final json = await client.requestJson(
        HttpMethod.get, 'payment_methods', ApiVersion.v2);
    final Map<String, dynamic> data = json as Map<String, dynamic>;
    if (data['id'] == null) {
      throw PaymentMethodsNotInitializedException(
         ErrorMessages.noPaymentMethodsSetUp);
    }
    return PaymentMethodsSummary.fromJson(json);
  }

  /// Retrieves a [PaymentMethod] by priority.
  Future<PaymentMethod?> retrievePaymentMethod(
      PaymentMethodPriority priority) async {
    PaymentMethodsSummary paymentMethods = await retrievePaymentMethods();
    if (priority.matches(PaymentMethodPriority.primary)) {
      return paymentMethods.primaryPaymentMethod;
    } else if (priority.matches(PaymentMethodPriority.secondary)) {
      return paymentMethods.secondaryPaymentMethod;
    } else {
      return null;
    }
  }

  /// Adds a credit card [PaymentMethod] to your account via Stripe.
  Future<PaymentMethod> addCreditCard(AddCreditCard parameters,
      {PaymentMethodPriority? priority}) async {
    ExtrasService extrasService = ExtrasService(client);
    Map<String, dynamic> parameterMap = await extrasService
        .createParametersToAddCreditCardToEasyPostViaStripe(parameters,
            priority: priority);
    final json = await client.requestJson(
        HttpMethod.post, 'credit_cards', ApiVersion.v2,
        parameters: parameterMap);
    return PaymentMethod.fromJson(json);
  }

  /// Adds a bank account [PaymentMethod] to your account via Stripe.
  Future<PaymentMethod> addBankAccount(AddBankAccount parameters) async {
    final json = await client.requestJson(
        HttpMethod.post, 'bank_accounts', ApiVersion.v2,
        parameters: parameters.constructJson(client: client));
    return PaymentMethod.fromJson(json);
  }

  /// Adds a bank account [PaymentMethod] to your account via Plaid.
  Future<PaymentMethod> addBankAccountViaPlaid(
      AddPlaidBankAccount parameters) async {
    final json = await client.requestJson(
        HttpMethod.post, 'bank_accounts', ApiVersion.v2,
        parameters: parameters.constructJson(client: client));
    return PaymentMethod.fromJson(json);
  }

  /// Funds your account with an established [PaymentMethod].
  Future<bool> fundWallet(FundWallet parameters,
      {PaymentMethodPriority? priority}) async {
    priority ??= PaymentMethodPriority.primary;
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw ResourceNotFoundException(ErrorMessages.paymentMethodNotFound);
    }

    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);

    await client.request(
        HttpMethod.post,
        '${paymentMethod.type!.endpoint}/${paymentMethod.id}/charges',
        ApiVersion.v2,
        parameters: parameterMap);

    return true;
  }

  /// Lists all [PaymentLog]s.
  Future<PaymentLogCollection> listPaymentLogs(
      {ListPaymentLogs? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'payment_logs', ApiVersion.v2,
        parameters: parameterMap);
    final collection = PaymentLogCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [PaymentLogCollection].
  Future<PaymentLogCollection> getNextPageOfPaymentLogs(
      PaymentLogCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListPaymentLogs? parameters) {
      return listPaymentLogs(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.paymentLogs,
        pageSize: pageSize) as Future<PaymentLogCollection>;
  }

  /// Deletes a [PaymentMethod].
  Future<bool> deletePaymentMethod(PaymentMethodPriority priority) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw ResourceNotFoundException(ErrorMessages.paymentMethodNotFound);
    }

    return await client.request(HttpMethod.delete,
        '${paymentMethod.type!.endpoint}/${paymentMethod.id}', ApiVersion.v2);
  }

  /// Deletes all [PaymentMethod]s.
  Future<bool> deleteAllPaymentMethods() async {
    PaymentMethodsSummary paymentMethods = await retrievePaymentMethods();
    if (paymentMethods.primaryPaymentMethod != null) {
      await deletePaymentMethod(PaymentMethodPriority.primary);
    }
    if (paymentMethods.secondaryPaymentMethod != null) {
      await deletePaymentMethod(PaymentMethodPriority.secondary);
    }
    return true;
  }
}

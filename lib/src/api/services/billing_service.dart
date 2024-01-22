import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/billing/fund_wallet.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/payment_methods_not_initialized_exception.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/enums/payment_method_type.dart';
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
          "Payment methods have not been set up yet.");
    }
    return PaymentMethodsSummary.fromJson(json);
  }

  /// Retrieves a [PaymentMethod] by priority
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

  /// Funds your account with an established [PaymentMethod].
  Future<bool> fundWallet(FundWallet parameters,
      {PaymentMethodPriority? priority}) async {
    priority ??= PaymentMethodPriority.primary;
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw ResourceNotFoundException('No payment method found.');
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

  /// Deletes a [PaymentMethod].
  Future<bool> deletePaymentMethod(PaymentMethodPriority priority) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw ResourceNotFoundException('No payment method found.');
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

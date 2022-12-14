import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models.dart';
import 'package:easypost/src/parameters/billing.dart';

/// The [BillingService] handles billing with the EasyPost API.
class BillingService extends Service {
  BillingService(Client client) : super(client);

  /// Retrieves all payment methods via a [PaymentMethodsSummary].
  Future<PaymentMethodsSummary> retrievePaymentMethods() async {
    final json = await client.requestJson(
        HttpMethod.get, 'payment_methods', ApiVersion.v2);
    // TODO: Handle missing ID meaning payment methods are not set up.
    return PaymentMethodsSummary.fromJson(json);
  }

  /// Retrieves a [PaymentMethod] by priority
  Future<PaymentMethod?> retrievePaymentMethod(
      PaymentMethodPriority priority) async {
    PaymentMethodsSummary paymentMethods = await retrievePaymentMethods();
    switch (priority) {
      case PaymentMethodPriority.primary:
        return paymentMethods.primaryPaymentMethod;
      case PaymentMethodPriority.secondary:
        return paymentMethods.secondaryPaymentMethod;
    }
  }

  /// Funds your account with an established [PaymentMethod].
  Future<bool> fundWallet(BillingFund parameters,
      {PaymentMethodPriority priority = PaymentMethodPriority.primary}) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw Exception('No payment method found.');
    }

    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);

    return await client.request(HttpMethod.post,
        '${paymentMethod.type!.endpoint}/${paymentMethod.id}/charges', ApiVersion.v2,
        parameters: parameterMap);
  }

  /// Deletes a [PaymentMethod].
  Future<bool> deletePaymentMethod(PaymentMethodPriority priority) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw Exception('No payment method found.');
    }

    return await client.request(
        HttpMethod.delete, '${paymentMethod.type!.endpoint}/${paymentMethod.id}', ApiVersion.v2);
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

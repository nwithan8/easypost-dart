import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models.dart';
import 'package:easypost/src/parameters/billing.dart';

/// The [BillingService] handles billing with the EasyPost API.
class BillingService extends Service {
  BillingService(Client client) : super(client);

  /// Retrieves all payment methods
  Future<PaymentMethodsSummary> retrievePaymentMethods() async {
    final json = await client.requestJson(
        HttpMethod.get, 'payment_methods', ApiVersion.v2);
    // TODO: Handle missing ID meaning payment methods are not set up.
    return PaymentMethodsSummary.fromJson(json);
  }

  /// Retrieves a payment method by priority
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

  /// Fund your account with an established payment method.
  Future<bool> fundWallet(BillingFund parameters,
      {PaymentMethodPriority priority = PaymentMethodPriority.primary}) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw Exception('No payment method found.');
    }

    Map<String, dynamic> parameterMap = parameters.toMap(client: client);

    return await client.request(HttpMethod.post,
        '${paymentMethod.type!.endpoint}/${paymentMethod.id}/charges', ApiVersion.v2,
        parameters: parameterMap);
  }

  /// Delete a payment method
  Future<bool> deletePaymentMethod(PaymentMethodPriority priority) async {
    PaymentMethod? paymentMethod = await retrievePaymentMethod(priority);
    if (paymentMethod == null) {
      throw Exception('No payment method found.');
    }

    return await client.request(
        HttpMethod.delete, '${paymentMethod.type!.endpoint}/${paymentMethod.id}', ApiVersion.v2);
  }

  /// Delete all payment methods
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

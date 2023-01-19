import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/billing.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_refund.dart';

/// The [ReferralCustomerService] handles referral customer-related requests with the EasyPost API.
class ReferralCustomerService extends Service {
  ReferralCustomerService(Client client) : super(client);

  /// Add a Stripe payment method to a [ReferralCustomer]'s account.
  Future<PaymentMethod> addStripePaymentMethod(
      BillingAddStripePaymentMethod parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'referral_customers/payment_method',
      ApiVersion.beta,
      parameters: parameterMap,
    );
  }

  /// Refund a [ReferralCustomer]'s account by either a specific amount or a specific payment log entry.
  /// Refund will be issued to the user's original payment method.
  Future<PaymentRefund> issueRefund(BillingIssueRefund parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'referral_customers/refunds',
      ApiVersion.beta,
      parameters: parameterMap,
    );
    return PaymentRefund.fromJson(json);
  }
}

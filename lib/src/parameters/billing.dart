import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';
import 'package:easypost/src/models/payment_method_priority.dart';

class BillingFund extends Parameters {
  @JsonParameter(Necessity.required, ['amount'])
  String? amount;

  BillingFund({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class BillingAddStripePaymentMethod extends Parameters {
  @JsonParameter(Necessity.required, ['payment_method', 'stripe_customer_id'])
  String? stripeCustomerId;

  @JsonParameter(Necessity.required, ['payment_method', 'payment_method_reference'])
  String? stripePaymentMethodId;

  @JsonParameter(Necessity.required, ['payment_method', 'priority'])
  PaymentMethodPriority? priority = PaymentMethodPriority.primary;

  BillingAddStripePaymentMethod({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class BillingIssueRefund extends Parameters {
  @JsonParameter(Necessity.optional, ['refund_amount'])
  String? amount;

  @JsonParameter(Necessity.optional, ['payment_method_id'])
  String? paymentMethodId;

  BillingIssueRefund({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

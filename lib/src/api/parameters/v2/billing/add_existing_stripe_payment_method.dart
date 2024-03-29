import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';

@reflector
class AddExistingStripePaymentMethod extends Parameters {
  @JsonParameter(Necessity.required, ['payment_method', 'stripe_customer_id'])
  String? stripeCustomerId;

  @JsonParameter(
      Necessity.required, ['payment_method', 'payment_method_reference'])
  String? stripePaymentMethodId;

  @JsonParameter(Necessity.required, ['payment_method', 'priority'])
  PaymentMethodPriority? priority = PaymentMethodPriority.primary;

  AddExistingStripePaymentMethod() : super();
}

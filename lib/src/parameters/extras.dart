import 'package:easypost/src/models/payment_method_priority.dart';
import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

class CreateCreditCard extends Parameters {
  @JsonParameter(Necessity.required, ['credit_card', 'stripe_object_id'])
  String? stripeToken;

  @JsonParameter(Necessity.required, ['credit_card', 'priority'])
  PaymentMethodPriority? priority;

  CreateCreditCard()
      : super();
}

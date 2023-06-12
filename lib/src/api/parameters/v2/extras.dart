import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/models/payment_method_priority.dart';

@reflector
class CreateCreditCard extends Parameters {
  @JsonParameter(Necessity.required, ['credit_card', 'stripe_object_id'])
  String? stripeToken;

  @JsonParameter(Necessity.required, ['credit_card', 'priority'])
  PaymentMethodPriority? priority;

  CreateCreditCard() : super();
}

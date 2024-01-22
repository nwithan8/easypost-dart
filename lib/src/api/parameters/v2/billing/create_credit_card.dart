import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';
import 'package:easypost/src/internal/reflection.dart';


@reflector
class CreateCreditCard extends Parameters {
  @JsonParameter(Necessity.required, ['credit_card', 'stripe_object_id'])
  String? stripeToken;

  @JsonParameter(Necessity.required, ['credit_card', 'priority'])
  PaymentMethodPriority? priority;

  CreateCreditCard() : super();
}

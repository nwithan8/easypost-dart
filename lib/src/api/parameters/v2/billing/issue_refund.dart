import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class IssueRefund extends Parameters {
  @JsonParameter(Necessity.optional, ['refund_amount'])
  String? amount;

  @JsonParameter(Necessity.optional, ['payment_method_id'])
  String? paymentMethodId;

  IssueRefund() : super();
}

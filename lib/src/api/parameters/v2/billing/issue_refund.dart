import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/internal/conversions.dart';

@reflector
class IssueRefund extends Parameters {
  @JsonParameter(Necessity.optional, ['refund_amount'],
      toJson: moneyToStringCents)
  double? amount;

  @JsonParameter(Necessity.optional, ['payment_log_id'])
  String? paymentLogId;

  IssueRefund() : super();
}

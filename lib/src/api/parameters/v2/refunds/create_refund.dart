import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateRefund extends Parameters {
  @JsonParameter(Necessity.required, ['refund', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, [
    'refund',
    'tracking_codes'
  ]) // yes, the param name is plural when it's really just one code
  String? trackingCode;

  CreateRefund()
      : super();
}
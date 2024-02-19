import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class InsureShipment extends Parameters {
  @JsonParameter(Necessity.required, ['amount'])
  double? amount;

  InsureShipment() : super();
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/internal/conversions.dart';

@reflector
class FundWallet extends Parameters {
  @JsonParameter(Necessity.required, ['amount'], toJson: moneyToStringCents)
  double? amount;

  FundWallet() : super();
}

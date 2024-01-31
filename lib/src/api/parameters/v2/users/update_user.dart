import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateUser extends Parameters {
  @JsonParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @JsonParameter(Necessity.optional, ['user', 'phone_number'])
  String? phoneNumber;

  @JsonParameter(Necessity.optional, ['user', 'recharge_amount'])
  String? rechargeAmount;

  @JsonParameter(Necessity.optional, ['user', 'recharge_threshold'])
  String? rechargeThreshold;

  @JsonParameter(Necessity.optional, ['user', 'secondary_recharge_amount'])
  String? secondaryRechargeAmount;

  @JsonParameter(Necessity.optional, ['user', 'default_insurance_amount'], toJson: moneyToStringCents)
  double? defaultInsuranceAmount;

  UpdateUser() : super();
}

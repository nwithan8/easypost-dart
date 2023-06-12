import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateUser extends Parameters {
  @JsonParameter(Necessity.optional, ['user', 'current_password'])
  String? currentPassword;

  @JsonParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @JsonParameter(Necessity.optional, ['user', 'password'])
  String? password;

  @JsonParameter(Necessity.optional, ['user', 'password_confirmation'])
  String? passwordConfirmation;

  @JsonParameter(Necessity.optional, ['user', 'phone_number'])
  String? phoneNumber;

  @JsonParameter(Necessity.optional, ['user', 'recharge_amount'])
  String? rechargeAmount;

  @JsonParameter(Necessity.optional, ['user', 'recharge_threshold'])
  String? rechargeThreshold;

  @JsonParameter(Necessity.optional, ['user', 'secondary_recharge_amount'])
  String? secondaryRechargeAmount;

  UpdateUser()
      : super();
}
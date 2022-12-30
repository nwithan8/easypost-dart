import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class UsersUpdate extends Update {
  @RequestParameter(Necessity.optional, ['user', 'current_password'])
  String? currentPassword;

  @RequestParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @RequestParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @RequestParameter(Necessity.optional, ['user', 'password'])
  String? password;

  @RequestParameter(Necessity.optional, ['user', 'password_confirmation'])
  String? passwordConfirmation;

  @RequestParameter(Necessity.optional, ['user', 'phone_number'])
  String? phoneNumber;

  @RequestParameter(Necessity.optional, ['user', 'recharge_amount'])
  String? rechargeAmount;

  @RequestParameter(Necessity.optional, ['user', 'recharge_threshold'])
  String? rechargeThreshold;

  @RequestParameter(Necessity.optional, ['user', 'secondary_recharge_amount'])
  String? secondaryRechargeAmount;

  UsersUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class UsersUpdateBrand extends Update {
  @RequestParameter(Necessity.optional, ['brand', 'ad'])
  String? adBase64;

  @RequestParameter(Necessity.optional, ['brand', 'ad_href'])
  String? adUrl;

  @RequestParameter(Necessity.optional, ['brand', 'background_color'])
  String? backgroundColorHexCode;

  @RequestParameter(Necessity.optional, ['brand', 'color'])
  String? colorHexCode;

  @RequestParameter(Necessity.optional, ['brand', 'logo'])
  String? logoBase64;

  @RequestParameter(Necessity.optional, ['brand', 'logo_href'])
  String? logoUrl;

  @RequestParameter(Necessity.optional, ['brand', 'theme'])
  String? theme;

  UsersUpdateBrand({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class UsersCreate extends Create {
  @RequestParameter(Necessity.optional, ['user', 'name'])
  String? name;

  UsersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class UsersUpdate extends Update {
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

  UsersUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class UsersUpdateBrand extends Update {
  @JsonParameter(Necessity.optional, ['brand', 'ad'])
  String? adBase64;

  @JsonParameter(Necessity.optional, ['brand', 'ad_href'])
  String? adUrl;

  @JsonParameter(Necessity.optional, ['brand', 'background_color'])
  String? backgroundColorHexCode;

  @JsonParameter(Necessity.optional, ['brand', 'color'])
  String? colorHexCode;

  @JsonParameter(Necessity.optional, ['brand', 'logo'])
  String? logoBase64;

  @JsonParameter(Necessity.optional, ['brand', 'logo_href'])
  String? logoUrl;

  @JsonParameter(Necessity.optional, ['brand', 'theme'])
  String? theme;

  UsersUpdateBrand({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class UsersCreate extends Create {
  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  UsersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

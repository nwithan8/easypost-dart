import 'package:easypost/easypost.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class ChangePassword extends Parameters {
  @JsonParameter(Necessity.optional, ['user', 'current_password'])
  String? currentPassword;

  @JsonParameter(Necessity.optional, ['user', 'password'])
  String? newPassword;

  @JsonParameter(Necessity.optional, ['user', 'password_confirmation'])
  String? newPasswordConfirmation;

  ChangePassword() : super();
}

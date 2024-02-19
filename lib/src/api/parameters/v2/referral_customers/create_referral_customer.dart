import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateReferralCustomer extends Parameters {
  @JsonParameter(Necessity.required, ['user', 'email'])
  String? email;

  @JsonParameter(Necessity.required, ['user', 'name'])
  String? name;

  @JsonParameter(Necessity.required, ['user', 'phone'])
  String? phoneNumber;

  CreateReferralCustomer() : super();
}

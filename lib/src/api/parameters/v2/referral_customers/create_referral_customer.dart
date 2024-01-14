import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateReferralCustomer extends Parameters {
  @JsonParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @JsonParameter(Necessity.optional, ['user', 'phone'])
  String? phoneNumber;

  CreateReferralCustomer() : super();
}

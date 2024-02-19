import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateReferralCustomerEmail extends Parameters {
  @JsonParameter(Necessity.required, ['user', 'email'])
  String? email;

  UpdateReferralCustomerEmail() : super();
}

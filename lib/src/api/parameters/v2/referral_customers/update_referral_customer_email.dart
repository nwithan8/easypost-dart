import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateReferralCustomerEmail extends Parameters {
  @Parameter(Necessity.required)
  String? email;

  UpdateReferralCustomerEmail() : super();
}
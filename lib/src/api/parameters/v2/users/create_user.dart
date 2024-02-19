import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateUser extends Parameters {
  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  CreateUser() : super();
}

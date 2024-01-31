import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class ListApiKeys extends Parameters {
  @JsonParameter(Necessity.optional, ['exclude_children'])
  bool? afterId;

  ListApiKeys() : super();
}

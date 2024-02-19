import 'package:easypost/src/enums/form_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateShipmentForm extends Parameters {
  @JsonParameter(Necessity.required, ['form', 'type'])
  FormType? formType;

  CreateShipmentForm() : super();
}

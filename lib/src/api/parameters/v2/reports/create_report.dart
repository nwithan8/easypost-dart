import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateReport extends Parameters {
  @JsonParameter(Necessity.optional, ['report', 'additional_columns'])
  List<String>? additionalColumns;

  @JsonParameter(Necessity.optional, ['report', 'columns'])
  List<String>? columns;

  @JsonParameter(Necessity.optional, ['report', 'end_date'])
  String? endDate;

  @JsonParameter(Necessity.optional, ['report', 'start_date'])
  String? startDate;

  @JsonParameter(Necessity.optional, ['report', 'send_email'])
  bool? sendEmail;

  @JsonParameter(Necessity.optional, ['report', 'include_children'])
  bool? includeChildren;

  CreateReport() : super();
}

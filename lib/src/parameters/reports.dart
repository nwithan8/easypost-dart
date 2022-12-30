import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class ReportsCreate extends Create {
  @RequestParameter(Necessity.optional, ['report', 'additional_columns'])
  List<String>? additionalColumns;

  @RequestParameter(Necessity.optional, ['report', 'columns'])
  List<String>? columns;

  @RequestParameter(Necessity.optional, ['report', 'end_date'])
  String? endDate;

  @RequestParameter(Necessity.optional, ['report', 'start_date'])
  String? startDate;

  @RequestParameter(Necessity.optional, ['report', 'send_email'])
  bool? sendEmail;

  @RequestParameter(Necessity.optional, ['report', 'include_children'])
  bool? includeChildren;

  ReportsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ReportsAll extends All {
  ReportsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

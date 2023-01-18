import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class ReportsCreate extends Create {
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

  ReportsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ReportsAll extends All {
  ReportsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

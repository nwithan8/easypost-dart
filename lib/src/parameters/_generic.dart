import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class Create extends RequestParameters {
  Create({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class Update extends RequestParameters {
  Update({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class All extends RequestParameters {
  @RequestParameter(Necessity.optional, ['after_id'])
  String? afterId;

  @RequestParameter(Necessity.optional, ['before_id'])
  String? beforeId;

  @RequestParameter(Necessity.optional, ['end_datetime'])
  String? endDatetime;

  @RequestParameter(Necessity.optional, ['start_datetime'])
  String? startDatetime;

  @RequestParameter(Necessity.optional, ['page_size'])
  int? pageSize;

  All({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

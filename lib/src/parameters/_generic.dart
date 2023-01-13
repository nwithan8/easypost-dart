import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

class Create extends Parameters {
  Create({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class Update extends Parameters {
  Update({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class All extends Parameters {
  @JsonParameter(Necessity.optional, ['after_id'])
  String? afterId;

  @JsonParameter(Necessity.optional, ['before_id'])
  String? beforeId;

  @JsonParameter(Necessity.optional, ['end_datetime'])
  String? endDatetime;

  @JsonParameter(Necessity.optional, ['start_datetime'])
  String? startDatetime;

  @JsonParameter(Necessity.optional, ['page_size'])
  int? pageSize;

  All({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

@reflector
class Create extends Parameters {
  Create({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class Update extends Parameters {
  Update({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
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

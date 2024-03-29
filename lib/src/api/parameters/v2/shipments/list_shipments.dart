import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class ListShipments extends Parameters {
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

  @JsonParameter(Necessity.optional, ['purchased'])
  bool? purchased;

  @JsonParameter(Necessity.optional, ['include_children'])
  bool? includeShipmentsFromChildren;

  ListShipments() : super();
}

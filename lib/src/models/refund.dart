import 'package:easypost/src/api/parameters/v2/refunds/list_refunds.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refund.g.dart';

@JsonSerializable(explicitToJson: true)
class Refund extends ReadOnlyModelWithId {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'confirmation_number')
  final String? confirmationNumber;

  @JsonKey(name: 'shipment_id')
  final String? shipmentId;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  Refund(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.carrier,
    this.confirmationNumber,
    this.shipmentId,
    this.status,
    this.trackingCode,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Refund.fromJson(Map<String, dynamic> input) =>
      _$RefundFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$RefundToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefundCollection extends PaginatedCollection<Refund, ListRefunds> {
  @JsonKey(name: 'refunds')
  final List<Refund>? refunds;

  RefundCollection(
      objectType, mode, hasMore, this.refunds)
      : super(objectType, mode, hasMore);

  factory RefundCollection.fromJson(Map<String, dynamic> input) =>
      _$RefundCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$RefundCollectionToJson(this);

  @override
  ListRefunds buildGetNextPageParameters(List<Refund>? currentPageItems, {int? pageSize}) {
    ListRefunds parameters = filters ?? ListRefunds();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

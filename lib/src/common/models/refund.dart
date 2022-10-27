import 'package:easypost/src/common/base/collection.dart';
import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refund.g.dart';

@JsonSerializable(explicitToJson: true)
class Refund extends Model {
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

  Map<String, dynamic> toJson() => _$RefundToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RefundCollection extends Collection {
  @JsonKey(name: 'refunds')
  final List<Refund>? refunds;

  RefundCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.refunds)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory RefundCollection.fromJson(Map<String, dynamic> input) =>
      _$RefundCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$RefundCollectionToJson(this);
}

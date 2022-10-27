import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch_shipment.g.dart';

@JsonSerializable(explicitToJson: true)
class BatchShipment extends Model {
  @JsonKey(name: 'batch_message')
  final String? batchMessage;

  @JsonKey(name: 'batch_status')
  final String? batchStatus;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  BatchShipment(id, createdAt, updatedAt, objectType, mode, this.batchMessage,
      this.batchStatus, this.trackingCode)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory BatchShipment.fromJson(Map<String, dynamic> input) =>
      _$BatchShipmentFromJson(input);

  Map<String, dynamic> toJson() => _$BatchShipmentToJson(this);
}

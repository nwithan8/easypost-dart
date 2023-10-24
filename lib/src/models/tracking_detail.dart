import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/tracking_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackingDetail extends ModelWithId {
  @JsonKey(name: 'datetime')
  final DateTime? datetime;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tracking_location')
  final TrackingLocation? trackingLocation;

  TrackingDetail(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.datetime,
    this.message,
    this.status,
    this.trackingLocation,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory TrackingDetail.fromJson(Map<String, dynamic> input) =>
      _$TrackingDetailFromJson(input);

  Map<String, dynamic> toJson() => _$TrackingDetailToJson(this);
}

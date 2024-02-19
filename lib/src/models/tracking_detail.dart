import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/models/tracking_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackingDetail extends ReadOnlyModel {
  @JsonKey(name: 'datetime')
  final DateTime? datetime;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tracking_location')
  final TrackingLocation? trackingLocation;

  TrackingDetail(
    objectType,
    mode,
    this.datetime,
    this.message,
    this.status,
    this.trackingLocation,
  ) : super(objectType, mode);

  factory TrackingDetail.fromJson(Map<String, dynamic> input) =>
      _$TrackingDetailFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$TrackingDetailToJson(this);
}

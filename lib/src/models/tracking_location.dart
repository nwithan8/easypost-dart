import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_location.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackingLocation extends ModelWithId {
  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'state')
  final String? state;

  @JsonKey(name: 'zip')
  final String? zip;

  TrackingLocation(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.city,
    this.country,
    this.state,
    this.zip,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory TrackingLocation.fromJson(Map<String, dynamic> input) =>
      _$TrackingLocationFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$TrackingLocationToJson(this);
}

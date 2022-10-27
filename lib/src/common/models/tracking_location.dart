import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracking_location.g.dart';

@JsonSerializable(explicitToJson: true)
class TrackingLocation extends Model {
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

  Map<String, dynamic> toJson() => _$TrackingLocationToJson(this);
}

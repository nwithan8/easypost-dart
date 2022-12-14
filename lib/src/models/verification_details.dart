import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_details.g.dart';

@JsonSerializable(explicitToJson: true)
class VerificationDetails extends Model {
  @JsonKey(name: 'latitude')
  final double? latitude;

  @JsonKey(name: 'longitude')
  final double? longitude;

  @JsonKey(name: 'time_zone')
  final String? timeZone;

  VerificationDetails(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.latitude,
    this.longitude,
    this.timeZone,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory VerificationDetails.fromJson(Map<String, dynamic> input) =>
      _$VerificationDetailsFromJson(input);

  Map<String, dynamic> toJson() => _$VerificationDetailsToJson(this);
}

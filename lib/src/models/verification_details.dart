import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_details.g.dart';

@JsonSerializable(explicitToJson: true)
class VerificationDetails extends ReadOnlyModel {
  @JsonKey(name: 'latitude')
  final double? latitude;

  @JsonKey(name: 'longitude')
  final double? longitude;

  @JsonKey(name: 'time_zone')
  final String? timeZone;

  VerificationDetails(
    objectType,
    mode,
    this.latitude,
    this.longitude,
    this.timeZone,
  ) : super(objectType, mode);

  factory VerificationDetails.fromJson(Map<String, dynamic> input) =>
      _$VerificationDetailsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$VerificationDetailsToJson(this);
}

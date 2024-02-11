// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationDetails _$VerificationDetailsFromJson(Map<String, dynamic> json) =>
    VerificationDetails(
      json['object'],
      json['mode'],
      (json['latitude'] as num?)?.toDouble(),
      (json['longitude'] as num?)?.toDouble(),
      json['time_zone'] as String?,
    );

Map<String, dynamic> _$VerificationDetailsToJson(
        VerificationDetails instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'time_zone': instance.timeZone,
    };

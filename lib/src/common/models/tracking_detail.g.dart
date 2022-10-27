// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingDetail _$TrackingDetailFromJson(Map<String, dynamic> json) =>
    TrackingDetail(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      json['message'] as String?,
      json['status'] as String?,
      json['tracking_location'] == null
          ? null
          : TrackingLocation.fromJson(
              json['tracking_location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrackingDetailToJson(TrackingDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'datetime': instance.datetime?.toIso8601String(),
      'message': instance.message,
      'status': instance.status,
      'tracking_location': instance.trackingLocation?.toJson(),
    };

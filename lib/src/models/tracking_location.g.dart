// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingLocation _$TrackingLocationFromJson(Map<String, dynamic> json) =>
    TrackingLocation(
      json['object'],
      json['mode'],
      json['city'] as String?,
      json['country'] as String?,
      json['state'] as String?,
      json['zip'] as String?,
    );

Map<String, dynamic> _$TrackingLocationToJson(TrackingLocation instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'city': instance.city,
      'country': instance.country,
      'state': instance.state,
      'zip': instance.zip,
    };

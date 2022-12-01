// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_in_transit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInTransit _$TimeInTransitFromJson(Map<String, dynamic> json) =>
    TimeInTransit(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['percentile_50'] as int?,
      json['percentile_75'] as int?,
      json['percentile_85'] as int?,
      json['percentile_90'] as int?,
      json['percentile_95'] as int?,
      json['percentile_97'] as int?,
      json['percentile_99'] as int?,
    );

Map<String, dynamic> _$TimeInTransitToJson(TimeInTransit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'percentile_50': instance.percentile50,
      'percentile_75': instance.percentile75,
      'percentile_85': instance.percentile85,
      'percentile_90': instance.percentile90,
      'percentile_95': instance.percentile95,
      'percentile_97': instance.percentile97,
      'percentile_99': instance.percentile99,
    };

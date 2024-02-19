// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_in_transit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInTransit _$TimeInTransitFromJson(Map<String, dynamic> json) =>
    TimeInTransit(
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
      'percentile_50': instance.percentile50,
      'percentile_75': instance.percentile75,
      'percentile_85': instance.percentile85,
      'percentile_90': instance.percentile90,
      'percentile_95': instance.percentile95,
      'percentile_97': instance.percentile97,
      'percentile_99': instance.percentile99,
    };

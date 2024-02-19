// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_info_service_level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierInfoServiceLevel _$CarrierInfoServiceLevelFromJson(
        Map<String, dynamic> json) =>
    CarrierInfoServiceLevel(
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['description'] as String?,
      (json['dimensions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['human_readable'] as String?,
      json['max_weight'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$CarrierInfoServiceLevelToJson(
        CarrierInfoServiceLevel instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'carrier': instance.carrier,
      'description': instance.description,
      'dimensions': instance.dimensions,
      'human_readable': instance.humanReadable,
      'max_weight': instance.maxWeight,
      'name': instance.name,
    };

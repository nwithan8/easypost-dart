// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierType _$CarrierTypeFromJson(Map<String, dynamic> json) => CarrierType(
      json['object'],
      json['mode'],
      json['fields'] as Map<String, dynamic>?,
      json['logo'] as String?,
      json['readable'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$CarrierTypeToJson(CarrierType instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'fields': instance.fields,
      'logo': instance.logo,
      'readable': instance.readable,
      'type': instance.type,
    };

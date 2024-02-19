// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_info_supported_feature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierInfoSupportedFeature _$CarrierInfoSupportedFeatureFromJson(
        Map<String, dynamic> json) =>
    CarrierInfoSupportedFeature(
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['description'] as String?,
      json['name'] as String?,
      json['supported'] as bool?,
    );

Map<String, dynamic> _$CarrierInfoSupportedFeatureToJson(
        CarrierInfoSupportedFeature instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'carrier': instance.carrier,
      'description': instance.description,
      'name': instance.name,
      'supported': instance.supported,
    };

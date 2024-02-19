// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_info_shipment_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierInfoShipmentOption _$CarrierInfoShipmentOptionFromJson(
        Map<String, dynamic> json) =>
    CarrierInfoShipmentOption(
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['deprecated'] as bool?,
      json['description'] as String?,
      json['human_readable'] as String?,
      json['name'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$CarrierInfoShipmentOptionToJson(
        CarrierInfoShipmentOption instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'carrier': instance.carrier,
      'deprecated': instance.deprecated,
      'description': instance.description,
      'human_readable': instance.humanReadable,
      'name': instance.name,
      'type': instance.type,
    };

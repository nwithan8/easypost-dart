// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_info_carrier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierInfoCarrier _$CarrierInfoCarrierFromJson(Map<String, dynamic> json) =>
    CarrierInfoCarrier(
      json['object'],
      json['mode'],
      json['name'] as String?,
      json['human_readable'] as String?,
      (json['predefined_packages'] as List<dynamic>?)
          ?.map((e) =>
              CarrierInfoPredefinedPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['service_levels'] as List<dynamic>?)
          ?.map((e) =>
              CarrierInfoServiceLevel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['shipment_options'] as List<dynamic>?)
          ?.map((e) =>
              CarrierInfoShipmentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['supported_features'] as List<dynamic>?)
          ?.map((e) =>
              CarrierInfoSupportedFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarrierInfoCarrierToJson(CarrierInfoCarrier instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'name': instance.name,
      'human_readable': instance.humanReadable,
      'predefined_packages':
          instance.predefinedPackages?.map((e) => e.toJson()).toList(),
      'service_levels': instance.serviceLevels?.map((e) => e.toJson()).toList(),
      'shipment_options':
          instance.shipmentOptions?.map((e) => e.toJson()).toList(),
      'supported_features':
          instance.supportedFeatures?.map((e) => e.toJson()).toList(),
    };

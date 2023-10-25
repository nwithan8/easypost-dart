// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierInfo _$CarrierInfoFromJson(Map<String, dynamic> json) => CarrierInfo(
      json['object'],
      json['mode'],
      (json['carriers'] as List<dynamic>?)
          ?.map((e) => CarrierInfoCarrier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CarrierInfoToJson(CarrierInfo instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'carriers': instance.carriers?.map((e) => e.toJson()).toList(),
    };

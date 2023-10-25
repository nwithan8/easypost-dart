// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierDetail _$CarrierDetailFromJson(Map<String, dynamic> json) =>
    CarrierDetail(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['alternate_identifier'] as String?,
      json['container_type'] as String?,
      json['destination_location'] as String?,
      stringToDateTime(json['est_delivery_date_local'] as String?),
      stringToDateTime(json['guaranteed_delivery_date'] as String?),
      stringToDateTime(json['initial_delivery_attempt'] as String?),
      json['origin_location'] as String?,
      json['service'] as String?,
    );

Map<String, dynamic> _$CarrierDetailToJson(CarrierDetail instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'alternate_identifier': instance.alternateIdentifier,
      'container_type': instance.containerType,
      'destination_location': instance.destinationLocation,
      'est_delivery_date_local':
          dateTimeToString(instance.estDeliveryDateLocal),
      'guaranteed_delivery_date':
          dateTimeToString(instance.guaranteedDeliveryDate),
      'initial_delivery_attempt':
          dateTimeToString(instance.initialDeliveryAttempt),
      'origin_location': instance.originLocation,
      'service': instance.service,
    };

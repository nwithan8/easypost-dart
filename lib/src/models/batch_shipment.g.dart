// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchShipment _$BatchShipmentFromJson(Map<String, dynamic> json) =>
    BatchShipment(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['batch_message'] as String?,
      json['batch_status'] as String?,
      json['tracking_code'] as String?,
    );

Map<String, dynamic> _$BatchShipmentToJson(BatchShipment instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'batch_message': instance.batchMessage,
      'batch_status': instance.batchStatus,
      'tracking_code': instance.trackingCode,
    };

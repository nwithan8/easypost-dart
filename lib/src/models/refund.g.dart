// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Refund _$RefundFromJson(Map<String, dynamic> json) => Refund(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['confirmation_number'] as String?,
      json['shipment_id'] as String?,
      json['status'] as String?,
      json['tracking_code'] as String?,
    );

Map<String, dynamic> _$RefundToJson(Refund instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'carrier': instance.carrier,
      'confirmation_number': instance.confirmationNumber,
      'shipment_id': instance.shipmentId,
      'status': instance.status,
      'tracking_code': instance.trackingCode,
    };

RefundCollection _$RefundCollectionFromJson(Map<String, dynamic> json) =>
    RefundCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['refunds'] as List<dynamic>?)
          ?.map((e) => Refund.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RefundCollectionToJson(RefundCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'refunds': instance.refunds?.map((e) => e.toJson()).toList(),
    };

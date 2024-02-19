// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Insurance _$InsuranceFromJson(Map<String, dynamic> json) => Insurance(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['status'] as String?,
      stringToMoney(json['amount'] as String?),
      json['from_address'] == null
          ? null
          : Address.fromJson(json['from_address'] as Map<String, dynamic>),
      (json['messages'] as List<dynamic>?)?.map((e) => e as String).toList(),
      InsuranceProvider.fromString(json['provider'] as String?),
      json['provider_id'] as String?,
      json['reference'] as String?,
      json['shipment_id'] as String?,
      json['to_address'] == null
          ? null
          : Address.fromJson(json['to_address'] as Map<String, dynamic>),
      json['tracker'] == null
          ? null
          : Tracker.fromJson(json['tracker'] as Map<String, dynamic>),
      json['tracking_code'] as String?,
    );

Map<String, dynamic> _$InsuranceToJson(Insurance instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'amount': moneyToString(instance.amount),
      'from_address': instance.fromAddress?.toJson(),
      'messages': instance.messages,
      'provider': InsuranceProvider.asString(instance.provider),
      'provider_id': instance.providerId,
      'reference': instance.reference,
      'shipment_id': instance.shipmentId,
      'status': instance.status,
      'to_address': instance.toAddress?.toJson(),
      'tracker': instance.tracker?.toJson(),
      'tracking_code': instance.trackingCode,
    };

InsuranceCollection _$InsuranceCollectionFromJson(Map<String, dynamic> json) =>
    InsuranceCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['insurances'] as List<dynamic>?)
          ?.map((e) => Insurance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsuranceCollectionToJson(
        InsuranceCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'insurances': instance.insurances?.map((e) => e.toJson()).toList(),
    };

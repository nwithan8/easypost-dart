// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierAccount _$CarrierAccountFromJson(Map<String, dynamic> json) =>
    CarrierAccount(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['billable_type'] as String?,
      json['credentials'] as Map<String, dynamic>?,
      json['description'] as String?,
      json['readable'] as String?,
      json['reference'] as String?,
      json['test_credentials'] as Map<String, dynamic>?,
      json['type'] as String?,
    );

Map<String, dynamic> _$CarrierAccountToJson(CarrierAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'billable_type': instance.billableType,
      'credentials': instance.credentials,
      'description': instance.description,
      'readable': instance.readable,
      'reference': instance.reference,
      'test_credentials': instance.testCredentials,
      'type': instance.type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxIdentifier _$TaxIdentifierFromJson(Map<String, dynamic> json) =>
    TaxIdentifier(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['entity'] as String?,
      json['issuing_country'] as String?,
      json['tax_id'] as String?,
      json['tax_id_type'] as String?,
    );

Map<String, dynamic> _$TaxIdentifierToJson(TaxIdentifier instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'entity': instance.entity,
      'issuing_country': instance.issuingCountry,
      'tax_id': instance.taxId,
      'tax_id_type': instance.taxIdType,
    };

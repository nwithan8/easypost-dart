// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax_identifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaxIdentifier _$TaxIdentifierFromJson(Map<String, dynamic> json) =>
    TaxIdentifier(
      entity: json['entity'] as String?,
      issuingCountry: json['issuing_country'] as String?,
      taxId: json['tax_id'] as String?,
      taxIdType: json['tax_id_type'] as String?,
    );

Map<String, dynamic> _$TaxIdentifierToJson(TaxIdentifier instance) =>
    <String, dynamic>{
      'entity': instance.entity,
      'issuing_country': instance.issuingCountry,
      'tax_id': instance.taxId,
      'tax_id_type': instance.taxIdType,
    };

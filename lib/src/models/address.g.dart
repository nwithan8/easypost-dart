// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['carrier_facility'] as String?,
      json['city'] as String?,
      json['company'] as String?,
      json['country'] as String?,
      json['email'] as String?,
      json['federal_tax_id'] as String?,
      json['message'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      json['residential'] as bool?,
      json['state'] as String?,
      json['state_tax_id'] as String?,
      json['street1'] as String?,
      json['street2'] as String?,
      json['verifications'] == null
          ? null
          : Verifications.fromJson(
              json['verifications'] as Map<String, dynamic>),
      json['zip'] as String?,
      json['error'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'carrier_facility': instance.carrierFacility,
      'city': instance.city,
      'company': instance.company,
      'country': instance.country,
      'email': instance.email,
      'error': instance.error,
      'federal_tax_id': instance.federalTaxId,
      'message': instance.message,
      'name': instance.name,
      'phone': instance.phone,
      'residential': instance.isResidential,
      'state': instance.state,
      'state_tax_id': instance.stateTaxId,
      'street1': instance.street1,
      'street2': instance.street2,
      'verifications': instance.verifications?.toJson(),
      'zip': instance.zip,
    };

AddressCollection _$AddressCollectionFromJson(Map<String, dynamic> json) =>
    AddressCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['addresses'] as List<dynamic>)
          .map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressCollectionToJson(AddressCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'end_shipper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EndShipper _$EndShipperFromJson(Map<String, dynamic> json) => EndShipper(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['carrier_facility'],
      json['city'],
      json['company'],
      json['country'],
      json['email'],
      json['federal_tax_id'],
      json['message'],
      json['name'],
      json['phone'],
      json['residential'],
      json['state'],
      json['state_tax_id'],
      json['street1'],
      json['street2'],
      json['verifications'],
      json['zip'],
      json['error'],
    );

Map<String, dynamic> _$EndShipperToJson(EndShipper instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
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
      'residential': instance.residential,
      'state': instance.state,
      'state_tax_id': instance.stateTaxId,
      'street1': instance.street1,
      'street2': instance.street2,
      'verifications': instance.verifications?.toJson(),
      'zip': instance.zip,
    };

EndShipperCollection _$EndShipperCollectionFromJson(
        Map<String, dynamic> json) =>
    EndShipperCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['end_shippers'] as List<dynamic>?)
          ?.map((e) => EndShipper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EndShipperCollectionToJson(
        EndShipperCollection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'end_shippers': instance.endShippers?.map((e) => e.toJson()).toList(),
    };

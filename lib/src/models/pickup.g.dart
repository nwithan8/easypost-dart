// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pickup _$PickupFromJson(Map<String, dynamic> json) => Pickup(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['carrier_accounts'] as List<dynamic>?)
          ?.map((e) => CarrierAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['confirmation'] as String?,
      json['instructions'] as String?,
      json['is_account_address'] as bool?,
      json['max_datetime'] == null
          ? null
          : DateTime.parse(json['max_datetime'] as String),
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['min_datetime'] == null
          ? null
          : DateTime.parse(json['min_datetime'] as String),
      json['name'] as String?,
      (json['pickup_rates'] as List<dynamic>?)
          ?.map((e) => PickupRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['reference'] as String?,
      json['status'] as String?,
    );

Map<String, dynamic> _$PickupToJson(Pickup instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'address': instance.address?.toJson(),
      'carrier_accounts':
          instance.carrierAccounts?.map((e) => e.toJson()).toList(),
      'confirmation': instance.confirmation,
      'instructions': instance.instructions,
      'is_account_address': instance.isAccountAddress,
      'max_datetime': instance.maxDatetime?.toIso8601String(),
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'min_datetime': instance.minDatetime?.toIso8601String(),
      'name': instance.name,
      'pickup_rates': instance.rates?.map((e) => e.toJson()).toList(),
      'reference': instance.reference,
      'status': instance.status,
    };

PickupCollection _$PickupCollectionFromJson(Map<String, dynamic> json) =>
    PickupCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['pickups'] as List<dynamic>?)
          ?.map((e) => Pickup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PickupCollectionToJson(PickupCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'has_more': instance.hasMore,
      'pickups': instance.pickups?.map((e) => e.toJson()).toList(),
    };

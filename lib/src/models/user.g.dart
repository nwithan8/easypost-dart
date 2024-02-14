// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      (json['api_keys'] as List<dynamic>?)
          ?.map((e) => ApiKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringToMoney(json['balance'] as String?),
      (json['children'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['email'] as String?,
      json['name'] as String?,
      json['parent_id'] as String?,
      json['password'] as String?,
      json['password_confirmation'] as String?,
      json['phone_number'] as String?,
      stringToMoney(json['price_per_shipment'] as String?),
      stringToMoney(json['recharge_amount'] as String?),
      json['recharge_threshold'] as String?,
      stringToMoney(json['secondary_recharge_amount'] as String?),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'api_keys': instance.apiKeys?.map((e) => e.toJson()).toList(),
      'balance': moneyToString(instance.balance),
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'email': instance.email,
      'name': instance.name,
      'parent_id': instance.parentId,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'phone_number': instance.phoneNumber,
      'price_per_shipment': moneyToString(instance.pricePerShipment),
      'recharge_amount': moneyToString(instance.rechargeAmount),
      'recharge_threshold': instance.rechargeThreshold,
      'secondary_recharge_amount':
          moneyToString(instance.secondaryRechargeAmount),
    };

ChildUserCollection _$ChildUserCollectionFromJson(Map<String, dynamic> json) =>
    ChildUserCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['children'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChildUserCollectionToJson(
        ChildUserCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'children': instance.children?.map((e) => e.toJson()).toList(),
    };

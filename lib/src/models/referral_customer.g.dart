// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral_customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReferralCustomer _$ReferralCustomerFromJson(Map<String, dynamic> json) =>
    ReferralCustomer(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['api_keys'],
      stringToMoney(json['balance'] as String?),
      json['children'],
      json['email'],
      json['name'],
      json['parent_id'],
      json['password'],
      json['password_confirmation'],
      json['phone_number'],
      stringToMoney(json['price_per_shipment'] as String?),
      stringToMoney(json['recharge_amount'] as String?),
      json['recharge_threshold'],
      stringToMoney(json['secondary_recharge_amount'] as String?),
    );

Map<String, dynamic> _$ReferralCustomerToJson(ReferralCustomer instance) =>
    <String, dynamic>{
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

ReferralCustomerCollection _$ReferralCustomerCollectionFromJson(
        Map<String, dynamic> json) =>
    ReferralCustomerCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['referral_customers'] as List<dynamic>?)
          ?.map((e) => ReferralCustomer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReferralCustomerCollectionToJson(
        ReferralCustomerCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'referral_customers':
          instance.referralCustomers?.map((e) => e.toJson()).toList(),
    };

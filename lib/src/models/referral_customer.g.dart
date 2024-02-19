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
      (json['api_keys'] as List<dynamic>?)
          ?.map((e) => ApiKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringToMoney(json['balance'] as String?),
      (json['children'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      stringToDouble(json['cc_fee_rate'] as String?),
      json['email'] as String?,
      stringToDouble(json['insurance_fee_rate'] as String?),
      stringToMoney(json['insurance_fee_minimum'] as String?),
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
      'cc_fee_rate': doubleToString(instance.convenienceFeeRate),
      'email': instance.email,
      'insurance_fee_rate': doubleToString(instance.insuranceFeeRate),
      'insurance_fee_minimum': moneyToString(instance.insuranceFeeMinimum),
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

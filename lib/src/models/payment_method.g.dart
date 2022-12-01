// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['bank_name'] as String?,
      json['brand'] as String?,
      json['country'] as String?,
      stringToDateTime(json['disabled_at'] as String?),
      json['exp_month'] as int?,
      json['exp_year'] as int?,
      json['last4'] as String?,
      json['name'] as String?,
      json['verified'] as bool?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'bank_name': instance.bankName,
      'brand': instance.brand,
      'country': instance.country,
      'disabled_at': dateTimeToString(instance.disabledAt),
      'exp_month': instance.expMonth,
      'exp_year': instance.expYear,
      'last4': instance.last4,
      'name': instance.name,
      'verified': instance.verified,
    };

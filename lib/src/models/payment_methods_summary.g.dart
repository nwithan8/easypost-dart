// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodsSummary _$PaymentMethodsSummaryFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodsSummary(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['primary_payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['primary_payment_method'] as Map<String, dynamic>),
      json['secondary_payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['secondary_payment_method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodsSummaryToJson(
        PaymentMethodsSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'primary_payment_method': instance.primaryPaymentMethod?.toJson(),
      'secondary_payment_method': instance.secondaryPaymentMethod?.toJson(),
    };

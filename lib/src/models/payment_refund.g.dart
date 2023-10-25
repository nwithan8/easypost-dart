// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_refund.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRefund _$PaymentRefundFromJson(Map<String, dynamic> json) =>
    PaymentRefund(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['refunded_amount'] as int?,
      json['refunded_amount_currencys'] as String?,
      (json['refunded_payment_logs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['payment_log_id'] as String?,
      (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentRefundToJson(PaymentRefund instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'refunded_amount': instance.refundedAmount,
      'refunded_amount_currencys': instance.refundCurrency,
      'refunded_payment_logs': instance.refundedPaymentLogsIds,
      'payment_log_id': instance.paymentLogId,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
    };

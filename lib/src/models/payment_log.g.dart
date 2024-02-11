// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentLog _$PaymentLogFromJson(Map<String, dynamic> json) => PaymentLog(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      PaymentLogStatus.fromString(json['status'] as String?),
      stringToMoney(json['amount'] as String?),
      json['details'] as String?,
      json['source_id'] as String?,
      json['target_id'] as String?,
      json['transaction_id'] as String?,
      json['user_id'] as String?,
      json['amount_subunits'] as String?,
      json['amount_currency'] as String?,
      json['balance_subunits'] as String?,
      json['balance_currency'] as String?,
      PaymentLogChargeType.fromString(json['charge_type'] as String?),
      json['is_debit'] as bool?,
      stringToMoney(json['previous_balance'] as String?),
      PaymentLogSourceType.fromString(json['source_type'] as String?),
      PaymentLogTargetType.fromString(json['target_type'] as String?),
    );

Map<String, dynamic> _$PaymentLogToJson(PaymentLog instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'amount': moneyToString(instance.amount),
      'details': instance.details,
      'source_id': instance.sourceId,
      'target_id': instance.targetId,
      'transaction_id': instance.transactionId,
      'user_id': instance.userId,
      'amount_subunits': instance.amountSubunits,
      'amount_currency': instance.amountCurrency,
      'balance_subunits': instance.balanceSubunits,
      'balance_currency': instance.balanceCurrency,
      'charge_type': PaymentLogChargeType.asString(instance.chargeType),
      'is_debit': instance.isDebit,
      'previous_balance': moneyToString(instance.previousBalance),
      'status': PaymentLogStatus.asString(instance.status),
      'source_type': PaymentLogSourceType.asString(instance.sourceType),
      'target_type': PaymentLogTargetType.asString(instance.targetType),
    };

PaymentLogCollection _$PaymentLogCollectionFromJson(
        Map<String, dynamic> json) =>
    PaymentLogCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['payment_logs'] as List<dynamic>)
          .map((e) => PaymentLog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentLogCollectionToJson(
        PaymentLogCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'payment_logs': instance.paymentLogs.map((e) => e.toJson()).toList(),
    };

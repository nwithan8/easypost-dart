// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quoted_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuotedRate _$QuotedRateFromJson(Map<String, dynamic> json) => QuotedRate(
      json['object'],
      json['mode'],
      json['billing_type'] as String?,
      json['carrier'] as String?,
      json['carrier_account_id'] as String?,
      json['currency'] as String?,
      json['delivery_date'] == null
          ? null
          : DateTime.parse(json['delivery_date'] as String),
      json['delivery_date_guaranteed'] as bool?,
      json['delivery_days'] as int?,
      json['est_delivery_days'] as int?,
      json['list_currency'] as String?,
      anyToMoney(json['list_rate']),
      anyToMoney(json['rate']),
      json['retail_currency'] as String?,
      anyToMoney(json['retail_rate']),
      json['service'] as String?,
    );

Map<String, dynamic> _$QuotedRateToJson(QuotedRate instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'billing_type': instance.billingType,
      'carrier': instance.carrier,
      'carrier_account_id': instance.carrierAccountId,
      'currency': instance.currency,
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'delivery_date_guaranteed': instance.deliveryDateIsGuaranteed,
      'delivery_days': instance.deliveryDays,
      'est_delivery_days': instance.estDeliveryDays,
      'list_currency': instance.listCurrency,
      'list_rate': moneyToString(instance.listRate),
      'rate': moneyToString(instance.price),
      'retail_currency': instance.retailCurrency,
      'retail_rate': moneyToString(instance.retailRate),
      'service': instance.service,
    };

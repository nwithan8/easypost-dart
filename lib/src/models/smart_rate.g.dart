// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SmartRate _$SmartRateFromJson(Map<String, dynamic> json) => SmartRate(
      json['object'],
      json['mode'],
      json['billing_type'],
      json['carrier'],
      json['carrier_account_id'],
      json['currency'],
      json['delivery_date'],
      json['delivery_date_guaranteed'],
      json['delivery_days'],
      json['est_delivery_days'],
      json['list_currency'],
      stringToMoney(json['list_rate'] as String?),
      stringToMoney(json['rate'] as String?),
      json['retail_currency'],
      stringToMoney(json['retail_rate'] as String?),
      json['service'],
      json['shipment_id'],
      json['time_in_transit'] == null
          ? null
          : TimeInTransit.fromJson(
              json['time_in_transit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SmartRateToJson(SmartRate instance) => <String, dynamic>{
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
      'shipment_id': instance.shipmentId,
      'time_in_transit': instance.timeInTransit?.toJson(),
    };

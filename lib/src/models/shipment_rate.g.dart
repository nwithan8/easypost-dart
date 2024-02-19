// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShipmentRate _$ShipmentRateFromJson(Map<String, dynamic> json) => ShipmentRate(
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
      anyToMoney(json['list_rate']),
      anyToMoney(json['rate']),
      json['retail_currency'],
      anyToMoney(json['retail_rate']),
      json['service'],
      json['id'] as String?,
      json['shipment_id'] as String?,
    );

Map<String, dynamic> _$ShipmentRateToJson(ShipmentRate instance) =>
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
      'id': instance.id,
      'shipment_id': instance.shipmentId,
    };

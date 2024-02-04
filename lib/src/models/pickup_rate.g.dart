// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickupRate _$PickupRateFromJson(Map<String, dynamic> json) => PickupRate(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
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
      json['pickup_id'] as String?,
    );

Map<String, dynamic> _$PickupRateToJson(PickupRate instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
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
      'pickup_id': instance.pickupId,
    };

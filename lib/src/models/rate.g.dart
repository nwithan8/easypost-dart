// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['billing_type'] as String?,
      json['carbon_offset'] == null
          ? null
          : CarbonOffset.fromJson(
              json['carbon_offset'] as Map<String, dynamic>),
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
      stringToMoney(json['list_rate'] as String?),
      stringToMoney(json['rate'] as String?),
      json['retail_currency'] as String?,
      stringToMoney(json['retail_rate'] as String?),
      json['service'] as String?,
      json['shipment_id'] as String?,
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'billing_type': instance.billingType,
      'carbon_offset': instance.carbonOffset?.toJson(),
      'carrier': instance.carrier,
      'carrier_account_id': instance.carrierAccountId,
      'currency': instance.currency,
      'delivery_date': instance.deliveryDate?.toIso8601String(),
      'delivery_date_guaranteed': instance.deliveryDateGuaranteed,
      'delivery_days': instance.deliveryDays,
      'est_delivery_days': instance.estDeliveryDays,
      'list_currency': instance.listCurrency,
      'list_rate': moneyToString(instance.listRate),
      'rate': moneyToString(instance.rate),
      'retail_currency': instance.retailCurrency,
      'retail_rate': moneyToString(instance.retailRate),
      'service': instance.service,
      'shipment_id': instance.shipmentId,
    };

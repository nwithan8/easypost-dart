// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['buyer_address'] == null
          ? null
          : Address.fromJson(json['buyer_address'] as Map<String, dynamic>),
      (json['carrier_accounts'] as List<dynamic>?)
          ?.map((e) => CarrierAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['customs_info'] == null
          ? null
          : CustomsInfo.fromJson(json['customs_info'] as Map<String, dynamic>),
      json['from_address'] == null
          ? null
          : Address.fromJson(json['from_address'] as Map<String, dynamic>),
      json['is_return'] as bool?,
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['rates'] as List<dynamic>?)
          ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['reference'] as String?,
      json['return_address'] == null
          ? null
          : Address.fromJson(json['return_address'] as Map<String, dynamic>),
      json['service'] as String?,
      (json['shipments'] as List<dynamic>?)
          ?.map((e) => Shipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['to_address'] == null
          ? null
          : Address.fromJson(json['to_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'buyer_address': instance.buyerAddress?.toJson(),
      'carrier_accounts':
          instance.carrierAccounts?.map((e) => e.toJson()).toList(),
      'customs_info': instance.customsInfo?.toJson(),
      'from_address': instance.fromAddress?.toJson(),
      'is_return': instance.isReturn,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'rates': instance.rates?.map((e) => e.toJson()).toList(),
      'reference': instance.reference,
      'return_address': instance.returnAddress?.toJson(),
      'service': instance.service,
      'shipments': instance.shipments?.map((e) => e.toJson()).toList(),
      'to_address': instance.toAddress?.toJson(),
    };

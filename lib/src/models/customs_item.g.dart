// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customs_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomsItem _$CustomsItemFromJson(Map<String, dynamic> json) => CustomsItem(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['code'] as String?,
      json['currency'] as String?,
      json['description'] as String?,
      json['hs_tariff_number'] as String?,
      json['origin_country'] as String?,
      json['quantity'] as int?,
      json['value'] as String?,
      (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CustomsItemToJson(CustomsItem instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'code': instance.code,
      'currency': instance.currency,
      'description': instance.description,
      'hs_tariff_number': instance.hsTariffNumber,
      'origin_country': instance.originCountry,
      'quantity': instance.quantity,
      'value': instance.value,
      'weight': instance.weight,
    };

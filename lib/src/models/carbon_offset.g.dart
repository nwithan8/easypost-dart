// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carbon_offset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarbonOffset _$CarbonOffsetFromJson(Map<String, dynamic> json) => CarbonOffset(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['currency'] as String?,
      json['grams'] as int?,
      stringToMoney(json['price'] as String?),
    );

Map<String, dynamic> _$CarbonOffsetToJson(CarbonOffset instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'currency': instance.currency,
      'grams': instance.grams,
      'price': moneyToString(instance.price),
    };

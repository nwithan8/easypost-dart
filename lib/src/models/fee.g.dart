// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      stringToMoney(json['amount'] as String?),
      json['charged'] as bool?,
      json['refunded'] as bool?,
      json['type'] as String?,
    );

Map<String, dynamic> _$FeeToJson(Fee instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'amount': moneyToString(instance.amount),
      'charged': instance.wasCharged,
      'refunded': instance.wasRefunded,
      'type': instance.type,
    };

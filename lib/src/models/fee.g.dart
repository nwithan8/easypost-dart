// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fee _$FeeFromJson(Map<String, dynamic> json) => Fee(
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
      'amount': moneyToString(instance.amount),
      'charged': instance.wasCharged,
      'refunded': instance.wasRefunded,
      'type': instance.type,
    };

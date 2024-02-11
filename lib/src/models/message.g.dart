// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['carrier_account_id'] as String?,
      json['message'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'carrier': instance.carrier,
      'carrier_account_id': instance.carrierAccountId,
      'message': instance.message,
      'type': instance.type,
    };

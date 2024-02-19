// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verifications _$VerificationsFromJson(Map<String, dynamic> json) =>
    Verifications(
      json['object'],
      json['mode'],
      json['delivery'] == null
          ? null
          : Verification.fromJson(json['delivery'] as Map<String, dynamic>),
      json['zip4'] == null
          ? null
          : Verification.fromJson(json['zip4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerificationsToJson(Verifications instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'delivery': instance.delivery?.toJson(),
      'zip4': instance.zip4?.toJson(),
    };

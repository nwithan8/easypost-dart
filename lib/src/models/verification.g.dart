// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Verification _$VerificationFromJson(Map<String, dynamic> json) => Verification(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['details'] == null
          ? null
          : VerificationDetails.fromJson(
              json['details'] as Map<String, dynamic>),
      (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['success'] as bool?,
    );

Map<String, dynamic> _$VerificationToJson(Verification instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'details': instance.details?.toJson(),
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
      'success': instance.wasSuccessful,
    };

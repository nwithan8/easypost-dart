// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      json['object'],
      json['mode'],
      json['code'] as String?,
      (json['errors'] as List<dynamic>?)
          ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['field'] as String?,
      json['message'] as String?,
      json['suggestion'] as String?,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'code': instance.code,
      'errors': instance.errors?.map((e) => e.toJson()).toList(),
      'field': instance.field,
      'message': instance.message,
      'suggestion': instance.suggestion,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_with_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelWithId _$ModelWithIdFromJson(Map<String, dynamic> json) => ModelWithId(
      json['id'] as String,
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
    );

Map<String, dynamic> _$ModelWithIdToJson(ModelWithId instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
    };

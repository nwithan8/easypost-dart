// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readonly_model_with_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadOnlyModelWithId _$ReadOnlyModelWithIdFromJson(Map<String, dynamic> json) =>
    ReadOnlyModelWithId(
      json['id'] as String,
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
    );

Map<String, dynamic> _$ReadOnlyModelWithIdToJson(
        ReadOnlyModelWithId instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
    };

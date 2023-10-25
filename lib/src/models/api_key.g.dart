// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiKey _$ApiKeyFromJson(Map<String, dynamic> json) => ApiKey(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['key'] as String?,
    );

Map<String, dynamic> _$ApiKeyToJson(ApiKey instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'key': instance.key,
    };

ApiKeyCollection _$ApiKeyCollectionFromJson(Map<String, dynamic> json) =>
    ApiKeyCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['children'] as List<dynamic>?)
          ?.map((e) => ApiKeyCollection.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['keys'] as List<dynamic>?)
          ?.map((e) => ApiKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ApiKeyCollectionToJson(ApiKeyCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'has_more': instance.hasMore,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'keys': instance.keys?.map((e) => e.toJson()).toList(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      (json['completed_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['description'] as String?,
      (json['pending_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['previous_attributes'] as Map<String, dynamic>?,
      json['result'] as Map<String, dynamic>?,
      json['status'] as String?,
      json['user_id'] as String?,
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'completed_urls': instance.completedUrls,
      'description': instance.description,
      'pending_urls': instance.pendingUrls,
      'previous_attributes': instance.previousAttributes,
      'result': instance.result,
      'status': instance.status,
      'user_id': instance.userId,
    };

EventCollection _$EventCollectionFromJson(Map<String, dynamic> json) =>
    EventCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['events'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventCollectionToJson(EventCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'has_more': instance.hasMore,
      'events': instance.events?.map((e) => e.toJson()).toList(),
    };

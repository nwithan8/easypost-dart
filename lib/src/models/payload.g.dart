// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['request_url'] as String?,
      (json['request_headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['request_body'] as Map<String, dynamic>?,
      (json['response_headers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['response_body'] as String?,
      json['response_code'] as int?,
      json['total_time'] as int?,
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'request_url': instance.requestUrl,
      'request_headers': instance.requestHeaders,
      'request_body': instance.requestBody,
      'response_headers': instance.responseHeaders,
      'response_body': instance.responseBody,
      'response_code': instance.responseCode,
      'total_time': instance.totalTime,
    };

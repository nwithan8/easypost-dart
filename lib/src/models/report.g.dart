// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      json['include_children'] as bool?,
      json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      json['status'] as String?,
      json['url'] as String?,
      json['url_expires_at'] == null
          ? null
          : DateTime.parse(json['url_expires_at'] as String),
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'end_date': instance.endDate?.toIso8601String(),
      'include_children': instance.includeChildren,
      'start_date': instance.startDate?.toIso8601String(),
      'status': instance.status,
      'url': instance.url,
      'url_expires_at': instance.urlExpiresAt?.toIso8601String(),
    };

ReportCollection _$ReportCollectionFromJson(Map<String, dynamic> json) =>
    ReportCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['reports'] as List<dynamic>?)
          ?.map((e) => Report.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['type'] as String?,
    );

Map<String, dynamic> _$ReportCollectionToJson(ReportCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'reports': instance.reports?.map((e) => e.toJson()).toList(),
      'type': instance.type,
    };

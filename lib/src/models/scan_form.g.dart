// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScanForm _$ScanFormFromJson(Map<String, dynamic> json) => ScanForm(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      json['batch_id'] as String?,
      json['form_file_type'] as String?,
      json['form_url'] as String?,
      json['message'] as String?,
      json['status'] as String?,
      (json['tracking_codes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ScanFormToJson(ScanForm instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'address': instance.address?.toJson(),
      'batch_id': instance.batchId,
      'form_file_type': instance.formFileType,
      'form_url': instance.formUrl,
      'message': instance.message,
      'status': instance.status,
      'tracking_codes': instance.trackingCodes,
    };

ScanFormCollection _$ScanFormCollectionFromJson(Map<String, dynamic> json) =>
    ScanFormCollection(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['has_more'],
      (json['scan_forms'] as List<dynamic>?)
          ?.map((e) => ScanForm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScanFormCollectionToJson(ScanFormCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'has_more': instance.hasMore,
      'scan_forms': instance.scanForms?.map((e) => e.toJson()).toList(),
    };

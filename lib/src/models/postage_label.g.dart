// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postage_label.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostageLabel _$PostageLabelFromJson(Map<String, dynamic> json) => PostageLabel(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['date_advance'] as int?,
      json['integrated_form'] as String?,
      json['label_date'] == null
          ? null
          : DateTime.parse(json['label_date'] as String),
      json['label_epl2_url'] as String?,
      json['label_file'] as String?,
      json['label_file_type'] as String?,
      json['label_pdf_url'] as String?,
      json['label_resolution'] as int?,
      json['label_size'] as String?,
      json['label_type'] as String?,
      json['label_url'] as String?,
      json['label_zpl_url'] as String?,
    );

Map<String, dynamic> _$PostageLabelToJson(PostageLabel instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'date_advance': instance.dateAdvance,
      'integrated_form': instance.integratedForm,
      'label_date': instance.labelDate?.toIso8601String(),
      'label_epl2_url': instance.labelEpl2Url,
      'label_file': instance.labelFile,
      'label_file_type': instance.labelFileType,
      'label_pdf_url': instance.labelPdfUrl,
      'label_resolution': instance.labelResolution,
      'label_size': instance.labelSize,
      'label_type': instance.labelType,
      'label_url': instance.labelUrl,
      'label_zpl_url': instance.labelZplUrl,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Form _$FormFromJson(Map<String, dynamic> json) => Form(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      FormType.fromString(json['form_type'] as String),
      json['form_url'] as String?,
      json['submitted_electronically'] as bool?,
    );

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'form_type': FormType.asString(instance.formType),
      'form_url': instance.formUrl,
      'submitted_electronically': instance.wasSubmittedElectronically,
    };

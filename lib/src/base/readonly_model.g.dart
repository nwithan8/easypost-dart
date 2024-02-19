// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readonly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReadOnlyModel _$ReadOnlyModelFromJson(Map<String, dynamic> json) =>
    ReadOnlyModel(
      json['object'] as String?,
      json['mode'] as String?,
    );

Map<String, dynamic> _$ReadOnlyModelToJson(ReadOnlyModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.objectType);
  writeNotNull('mode', instance.mode);
  return val;
}

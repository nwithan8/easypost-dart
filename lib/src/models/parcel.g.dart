// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Parcel _$ParcelFromJson(Map<String, dynamic> json) => Parcel(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      (json['height'] as num?)?.toDouble(),
      (json['length'] as num?)?.toDouble(),
      json['predefined_package'] as String?,
      (json['weight'] as num?)?.toDouble(),
      (json['width'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ParcelToJson(Parcel instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'height': instance.height,
      'length': instance.length,
      'predefined_package': instance.predefinedPackage,
      'weight': instance.weight,
      'width': instance.width,
    };

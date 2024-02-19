// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      json['object'],
      json['mode'],
      json['ad'] as String?,
      json['ad_href'] as String?,
      json['background_color'] as String?,
      json['color'] as String?,
      json['logo'] as String?,
      json['logo_href'] as String?,
      json['name'] as String?,
      json['theme'] as String?,
      json['user_id'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'ad': instance.ad,
      'ad_href': instance.adHref,
      'background_color': instance.backgroundColorHexCode,
      'color': instance.colorHexCode,
      'logo': instance.logo,
      'logo_href': instance.logoHref,
      'name': instance.name,
      'theme': instance.theme,
      'user_id': instance.userId,
    };

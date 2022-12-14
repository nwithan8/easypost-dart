// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customs_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomsInfo _$CustomsInfoFromJson(Map<String, dynamic> json) => CustomsInfo(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['contents_explanation'] as String?,
      json['contents_type'] as String?,
      json['customs_certify'] as bool?,
      (json['customs_items'] as List<dynamic>?)
          ?.map((e) => CustomsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['customs_signer'] as String?,
      json['declaration'] as String?,
      json['eel_pfc'] as String?,
      json['non_delivery_option'] as String?,
      json['restriction_comments'] as String?,
      json['restriction_type'] as String?,
    );

Map<String, dynamic> _$CustomsInfoToJson(CustomsInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'object': instance.objectType,
      'mode': instance.mode,
      'contents_explanation': instance.contentsExplanation,
      'contents_type': instance.contentsType,
      'customs_certify': instance.customsCertify,
      'customs_items': instance.customsItems?.map((e) => e.toJson()).toList(),
      'customs_signer': instance.customsSigner,
      'declaration': instance.declaration,
      'eel_pfc': instance.eelPfc,
      'non_delivery_option': instance.nonDeliveryOption,
      'restriction_comments': instance.restrictionComments,
      'restriction_type': instance.restrictionType,
    };

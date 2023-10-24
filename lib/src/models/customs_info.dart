import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/enums/customs_form_type.dart';
import 'package:easypost/src/enums/customs_restriction_type.dart';
import 'package:easypost/src/enums/non_delivery_option.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/customs_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customs_info.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomsInfo extends ModelWithId {
  @JsonKey(name: 'contents_explanation')
  final String? contentsExplanation;

  @JsonKey(name: 'contents_type')
  final String? contentsType;

  @JsonKey(name: 'customs_certify')
  final bool? customsShouldCertify;

  @JsonKey(name: 'customs_items')
  final List<CustomsItem>? customsItems;

  @JsonKey(name: 'customs_signer')
  final String? customsSigner;

  @JsonKey(name: 'declaration')
  final String? declaration;

  @JsonKey(
      name: 'eel_pfc',
      fromJson: CustomsFormType.fromString,
      toJson: CustomsFormType.asString)
  final CustomsFormType? eelPfc;

  @JsonKey(
      name: 'non_delivery_option',
      fromJson: NonDeliveryOption.fromString,
      toJson: NonDeliveryOption.asString)
  final NonDeliveryOption? nonDeliveryOption;

  @JsonKey(name: 'restriction_comments')
  final String? restrictionComments;

  @JsonKey(
      name: 'restriction_type',
      fromJson: CustomsRestrictionType.fromString,
      toJson: CustomsRestrictionType.asString)
  final CustomsRestrictionType? restrictionType;

  CustomsInfo(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.contentsExplanation,
    this.contentsType,
    this.customsShouldCertify,
    this.customsItems,
    this.customsSigner,
    this.declaration,
    this.eelPfc,
    this.nonDeliveryOption,
    this.restrictionComments,
    this.restrictionType,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory CustomsInfo.fromJson(Map<String, dynamic> input) =>
      _$CustomsInfoFromJson(input);

  Map<String, dynamic> toJson() => _$CustomsInfoToJson(this);
}

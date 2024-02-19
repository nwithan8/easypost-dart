import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable(explicitToJson: true)
class Brand extends ReadOnlyModel {
  @JsonKey(name: 'ad')
  final String? ad;

  @JsonKey(name: 'ad_href')
  final String? adHref;

  @JsonKey(name: 'background_color')
  final String? backgroundColorHexCode;

  @JsonKey(name: 'color')
  final String? colorHexCode;

  @JsonKey(name: 'logo')
  final String? logo;

  @JsonKey(name: 'logo_href')
  final String? logoHref;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'theme')
  final String? theme;

  @JsonKey(name: 'user_id')
  final String? userId;

  Brand(
    objectType,
    mode,
    this.ad,
    this.adHref,
    this.backgroundColorHexCode,
    this.colorHexCode,
    this.logo,
    this.logoHref,
    this.name,
    this.theme,
    this.userId,
  ) : super(objectType, mode);

  factory Brand.fromJson(Map<String, dynamic> input) => _$BrandFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable(explicitToJson: true)
class Brand extends Model {
  @JsonKey(name: 'ad')
  final String? ad;

  @JsonKey(name: 'ad_href')
  final String? adHref;

  @JsonKey(name: 'background_color')
  final String? backgroundColor;

  @JsonKey(name: 'color')
  final String? color;

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
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.ad,
    this.adHref,
    this.backgroundColor,
    this.color,
    this.logo,
    this.logoHref,
    this.name,
    this.theme,
    this.userId,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Brand.fromJson(Map<String, dynamic> input) => _$BrandFromJson(input);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

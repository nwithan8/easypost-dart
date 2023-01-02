import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'customs_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomsItem extends Model {
  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'hs_tariff_number')
  final String? hsTariffNumber;

  @JsonKey(name: 'origin_country')
  final String? originCountry;

  @JsonKey(name: 'quantity')
  final int? quantity;

  @JsonKey(name: 'value')
  final String? value;

  @JsonKey(name: 'weight')
  final double? weight;

  CustomsItem(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.code,
    this.currency,
    this.description,
    this.hsTariffNumber,
    this.originCountry,
    this.quantity,
    this.value,
    this.weight,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory CustomsItem.fromJson(Map<String, dynamic> input) =>
      _$CustomsItemFromJson(input);

  Map<String, dynamic> toJson() => _$CustomsItemToJson(this);
}

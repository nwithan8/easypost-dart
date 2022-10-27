import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carbon_offset.g.dart';

@JsonSerializable(explicitToJson: true)
class CarbonOffset extends Model {
  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'grams')
  final int? grams;

  @JsonKey(name: 'price', fromJson: stringToMoney, toJson: moneyToString)
  final double? price;

  CarbonOffset(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.currency,
    this.grams,
    this.price,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory CarbonOffset.fromJson(Map<String, dynamic> input) =>
      _$CarbonOffsetFromJson(input);

  Map<String, dynamic> toJson() => _$CarbonOffsetToJson(this);
}

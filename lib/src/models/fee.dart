import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';


part 'fee.g.dart';

@JsonSerializable(explicitToJson: true)
class Fee extends Model {
  @JsonKey(
      name: 'amount', fromJson: stringToMoney, toJson: moneyToString)
  @JsonKey(name: 'amount')
  final double? amount;

  @JsonKey(name: 'charged')
  final bool? wasCharged;

  @JsonKey(name: 'refunded')
  final bool? wasRefunded;

  @JsonKey(name: 'type')
  final String? type;

  Fee(
    objectType,
    mode,
    this.amount,
    this.wasCharged,
    this.wasRefunded,
    this.type,
  ) : super(objectType, mode);

  factory Fee.fromJson(Map<String, dynamic> input) => _$FeeFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$FeeToJson(this);
}

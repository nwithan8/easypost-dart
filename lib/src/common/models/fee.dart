import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fee.g.dart';

@JsonSerializable(explicitToJson: true)
class Fee extends Model {
  @JsonKey(name: 'amount')
  final double? amount;

  @JsonKey(name: 'charged')
  final bool? charged;

  @JsonKey(name: 'refunded')
  final bool? refunded;

  @JsonKey(name: 'type')
  final String? type;

  Fee(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.amount,
    this.charged,
    this.refunded,
    this.type,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Fee.fromJson(Map<String, dynamic> input) => _$FeeFromJson(input);

  Map<String, dynamic> toJson() => _$FeeToJson(this);
}

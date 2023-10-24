import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message extends ModelWithId {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'carrier_account_id')
  final String? carrierAccountId;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'type')
  final String? type;

  Message(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.carrier,
    this.carrierAccountId,
    this.message,
    this.type,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Message.fromJson(Map<String, dynamic> input) =>
      _$MessageFromJson(input);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

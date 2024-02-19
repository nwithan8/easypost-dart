import 'package:easypost/src/base/readonly_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(explicitToJson: true)
class Message extends ReadOnlyModel {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'carrier_account_id')
  final String? carrierAccountId;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'type')
  final String? type;

  Message(
    objectType,
    mode,
    this.carrier,
    this.carrierAccountId,
    this.message,
    this.type,
  ) : super(objectType, mode);

  factory Message.fromJson(Map<String, dynamic> input) =>
      _$MessageFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

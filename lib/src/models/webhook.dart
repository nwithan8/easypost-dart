import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'webhook.g.dart';

@JsonSerializable(explicitToJson: true)
class Webhook extends Model {
  @JsonKey(name: 'disabled_at')
  final DateTime? disabledAt;

  @JsonKey(name: 'url')
  final String? url;

  Webhook(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.disabledAt,
    this.url,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Webhook.fromJson(Map<String, dynamic> input) =>
      _$WebhookFromJson(input);

  Map<String, dynamic> toJson() => _$WebhookToJson(this);
}

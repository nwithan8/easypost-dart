import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/verification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verifications.g.dart';

@JsonSerializable(explicitToJson: true)
class Verifications extends ModelWithId {
  @JsonKey(name: 'delivery')
  final Verification? delivery;

  @JsonKey(name: 'zip4')
  final Verification? zip4;

  Verifications(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.delivery,
    this.zip4,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Verifications.fromJson(Map<String, dynamic> input) =>
      _$VerificationsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$VerificationsToJson(this);
}

import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/verification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verifications.g.dart';

@JsonSerializable(explicitToJson: true)
class Verifications extends Model {
  @JsonKey(name: 'delivery')
  final Verification? delivery;

  @JsonKey(name: 'zip4')
  final Verification? zip4;

  Verifications(
    objectType,
    mode,
    this.delivery,
    this.zip4,
  ) : super(objectType, mode);

  factory Verifications.fromJson(Map<String, dynamic> input) =>
      _$VerificationsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$VerificationsToJson(this);
}

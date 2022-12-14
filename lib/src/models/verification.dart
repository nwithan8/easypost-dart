import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/error.dart';
import 'package:easypost/src/models/verification_details.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification.g.dart';

@JsonSerializable(explicitToJson: true)
class Verification extends Model {
  @JsonKey(name: 'details')
  final VerificationDetails? details;

  @JsonKey(name: 'errors')
  final List<Error>? errors;

  @JsonKey(name: 'success')
  final bool? success;

  Verification(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.details,
    this.errors,
    this.success,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Verification.fromJson(Map<String, dynamic> input) =>
      _$VerificationFromJson(input);

  Map<String, dynamic> toJson() => _$VerificationToJson(this);
}

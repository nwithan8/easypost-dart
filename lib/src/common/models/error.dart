import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(explicitToJson: true)
class Error extends Model {
  @JsonKey(name: 'code')
  final String? code;

  @JsonKey(name: 'errors')
  final List<Error>? errors;

  @JsonKey(name: 'field')
  final String? field;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'suggestion')
  final String? suggestion;

  Error(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.code,
    this.errors,
    this.field,
    this.message,
    this.suggestion,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Error.fromJson(Map<String, dynamic> input) => _$ErrorFromJson(input);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

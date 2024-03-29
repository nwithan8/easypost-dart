import 'package:easypost/src/base/readonly_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(explicitToJson: true)
class Error extends ReadOnlyModel {
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
    objectType,
    mode,
    this.code,
    this.errors,
    this.field,
    this.message,
    this.suggestion,
  ) : super(objectType, mode);

  factory Error.fromJson(Map<String, dynamic> input) => _$ErrorFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

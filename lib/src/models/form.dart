import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form.g.dart';

@JsonSerializable(explicitToJson: true)
class Form extends Model {
  @JsonKey(name: 'form_type')
  final String? formType;

  @JsonKey(name: 'form_url')
  final String? formUrl;

  @JsonKey(name: 'submitted_electronically')
  final bool? wasSubmittedElectronically;

  Form(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.formType,
    this.formUrl,
    this.wasSubmittedElectronically,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Form.fromJson(Map<String, dynamic> input) => _$FormFromJson(input);

  Map<String, dynamic> toJson() => _$FormToJson(this);
}

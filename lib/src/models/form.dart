import 'package:easypost/src/enums/form_type.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form.g.dart';

@JsonSerializable(explicitToJson: true)
class Form extends ReadOnlyModelWithId {
  @JsonKey(
      name: 'form_type',
      fromJson: FormType.fromString,
      toJson: FormType.asString)
  final FormType? formType;

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

  @override
  Map<String, dynamic> toJson() => _$FormToJson(this);
}

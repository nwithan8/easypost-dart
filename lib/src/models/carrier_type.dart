import 'package:easypost/src/base/readonly_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_type.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierType extends ReadOnlyModel {
  @JsonKey(name: 'fields')
  final Map<String, dynamic>? fields;

  @JsonKey(name: 'logo')
  final String? logo;

  @JsonKey(name: 'readable')
  final String? readable;

  @JsonKey(name: 'type')
  final String? type;

  CarrierType(
    objectType,
    mode,
    this.fields,
    this.logo,
    this.readable,
    this.type,
  ) : super(objectType, mode);

  factory CarrierType.fromJson(Map<String, dynamic> input) =>
      _$CarrierTypeFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierTypeToJson(this);
}

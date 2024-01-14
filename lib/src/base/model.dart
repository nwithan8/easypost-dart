import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

/// Superclass for all models.
@JsonSerializable(explicitToJson: true)
class Model {
  @JsonKey(name: 'object')
  final String? objectType;

  @JsonKey(name: 'mode')
  final String? mode;

  const Model(this.objectType, this.mode);

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

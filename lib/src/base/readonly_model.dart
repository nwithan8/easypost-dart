import 'package:easypost/src/base/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'readonly_model.g.dart';

/// Superclass for all models with an objectType and mode.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class ReadOnlyModel extends Model {
  @JsonKey(name: 'object')
  final String? objectType;

  @JsonKey(name: 'mode')
  final String? mode;

  const ReadOnlyModel(this.objectType, this.mode);

  factory ReadOnlyModel.fromJson(Map<String, dynamic> input) =>
      _$ReadOnlyModelFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ReadOnlyModelToJson(this);
}

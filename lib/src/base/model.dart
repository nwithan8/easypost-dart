import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

/// Superclass for all models.
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Model {
  const Model();

  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

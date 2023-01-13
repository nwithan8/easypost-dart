import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

/// Superclass for all models.
abstract class Model {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(
      name: 'created_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? createdAt;

  @JsonKey(
      name: 'updated_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? updatedAt;

  @JsonKey(name: 'object')
  final String? objectType;

  @JsonKey(name: 'mode')
  final String? mode;

  const Model(
      this.id, this.createdAt, this.updatedAt, this.objectType, this.mode);
}

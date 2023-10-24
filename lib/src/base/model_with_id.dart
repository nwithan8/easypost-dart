import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

/// Superclass for all models with an ID.
abstract class ModelWithId extends Model {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(
      name: 'created_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? createdAt;

  @JsonKey(
      name: 'updated_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? updatedAt;

  String? get prefix {
    if (id == null) {
      return null;
    }

    return id!.split('_').first;
  }

  ModelWithId(this.id, this.createdAt, this.updatedAt, objectType, mode)
      : super(objectType, mode);
}

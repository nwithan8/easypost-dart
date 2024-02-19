import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'readonly_model_with_id.g.dart';

/// Superclass for all models with an ID.
@JsonSerializable(explicitToJson: true)
class ReadOnlyModelWithId extends ReadOnlyModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(
      name: 'created_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? createdAt;

  @JsonKey(
      name: 'updated_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? updatedAt;

  String? get prefix {
    return id.split('_').first;
  }

  ReadOnlyModelWithId(this.id, this.createdAt, this.updatedAt, objectType, mode)
      : super(objectType, mode);

  @override
  Map<String, dynamic> toJson() => _$ReadOnlyModelWithIdToJson(this);
}

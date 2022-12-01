import 'package:easypost/src/base/model.dart';
import 'package:json_annotation/json_annotation.dart';

/// Superclass for all models.
abstract class Collection extends Model {
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  const Collection(id, createdAt, updatedAt, objectType, mode, this.hasMore)
      : super(id, createdAt, updatedAt, objectType, mode);
}

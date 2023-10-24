import 'package:easypost/src/base/model_with_id.dart';
import 'package:json_annotation/json_annotation.dart';

/// Superclass for all models.
abstract class Collection extends ModelWithId {
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  Collection(id, createdAt, updatedAt, objectType, mode, this.hasMore)
      : super(id, createdAt, updatedAt, objectType, mode);
}

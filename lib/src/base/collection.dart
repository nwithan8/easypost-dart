import 'package:easypost/src/base/model_with_id.dart';
import 'package:json_annotation/json_annotation.dart';

import '../internal/conversions.dart';

part 'collection.g.dart';

/// Superclass for all models.
@JsonSerializable(explicitToJson: true)
class Collection extends ModelWithId {
  @JsonKey(name: 'has_more')
  final bool? hasMore;

  Collection(id, createdAt, updatedAt, objectType, mode, this.hasMore)
      : super(id, createdAt, updatedAt, objectType, mode);

  @override
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}

import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_key.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiKey extends Model {
  @JsonKey(name: 'key')
  final String? key;

  ApiKey(id, createdAt, updatedAt, objectType, mode, this.key)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory ApiKey.fromJson(Map<String, dynamic> input) =>
      _$ApiKeyFromJson(input);

  Map<String, dynamic> toJson() => _$ApiKeyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApiKeyCollection extends Collection {
  @JsonKey(name: 'children')
  final List<ApiKeyCollection>? children;

  @JsonKey(name: 'keys')
  final List<ApiKey>? keys;

  ApiKeyCollection(id, createdAt, updatedAt, objectType, mode, hasMore,
      this.children, this.keys)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory ApiKeyCollection.fromJson(Map<String, dynamic> input) =>
      _$ApiKeyCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$ApiKeyCollectionToJson(this);
}

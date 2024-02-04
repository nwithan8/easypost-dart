import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_key.g.dart';

@JsonSerializable(explicitToJson: true)
class ApiKey extends ModelWithId {
  @JsonKey(name: 'key')
  final String? key;

  ApiKey(id, createdAt, updatedAt, objectType, mode, this.key)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory ApiKey.fromJson(Map<String, dynamic> input) =>
      _$ApiKeyFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ApiKeyToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApiKeyCollection extends ModelWithId {
  @JsonKey(name: 'children')
  final List<ApiKeyCollection>? children;

  @JsonKey(name: 'keys')
  final List<ApiKey>? keys;

  ApiKeyCollection(id, createdAt, updatedAt, objectType, mode,
      this.children, this.keys)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory ApiKeyCollection.fromJson(Map<String, dynamic> input) =>
      _$ApiKeyCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ApiKeyCollectionToJson(this);
}

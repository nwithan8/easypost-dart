import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event extends ModelWithId {
  @JsonKey(name: 'completed_urls')
  final List<String>? completedUrls;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'pending_urls')
  final List<String>? pendingUrls;

  @JsonKey(name: 'previous_attributes')
  final Map<String, dynamic>? previousAttributes;

  @JsonKey(name: 'result')
  final Map<String, dynamic>? result;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'user_id')
  final String? userId;

  Event(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.completedUrls,
    this.description,
    this.pendingUrls,
    this.previousAttributes,
    this.result,
    this.status,
    this.userId,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Event.fromJson(Map<String, dynamic> input) => _$EventFromJson(input);

  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EventCollection extends Collection {
  @JsonKey(name: 'events')
  final List<Event>? events;

  EventCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.events)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory EventCollection.fromJson(Map<String, dynamic> input) =>
      _$EventCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$EventCollectionToJson(this);
}

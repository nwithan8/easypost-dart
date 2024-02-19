import 'package:easypost/src/api/parameters/v2/events/list_events.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable(explicitToJson: true)
class Event extends ReadOnlyModelWithId {
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

  @override
  Map<String, dynamic> toJson() => _$EventToJson(this);
}

@JsonSerializable(explicitToJson: true)
class EventCollection extends PaginatedCollection<Event, ListEvents> {
  @JsonKey(name: 'events')
  final List<Event>? events;

  EventCollection(objectType, mode, hasMore, this.events)
      : super(objectType, mode, hasMore);

  factory EventCollection.fromJson(Map<String, dynamic> input) =>
      _$EventCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$EventCollectionToJson(this);

  @override
  ListEvents buildGetNextPageParameters(List<Event>? currentPageItems,
      {int? pageSize}) {
    ListEvents parameters = filters ?? ListEvents();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

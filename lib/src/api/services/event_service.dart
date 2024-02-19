import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/events/list_events.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/api/api_exception.dart';
import 'package:easypost/src/exceptions/api/bad_request_exception.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/payload.dart';

/// The [EventService] handles events with the EasyPost API.
class EventService extends Service {
  EventService(Client client) : super(client);

  /// Retrieve an [Event].
  Future<Event> retrieve(String eventId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'events/$eventId', ApiVersion.v2);
    return Event.fromJson(json);
  }

  /// List all [Event]s.
  Future<EventCollection> list({ListEvents? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'events', ApiVersion.v2,
        parameters: parameterMap);
    final collection = EventCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [EventCollection].
  Future<EventCollection> getNextPage(EventCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListEvents? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(retrieveNextPageFunction, collection.events,
        pageSize: pageSize) as Future<EventCollection>;
  }

  /// Retrieve a [Payload] for an [Event].
  Future<Payload> retrievePayload(String eventId, String payloadId) async {
    try {
      final json = await client.requestJson(
          HttpMethod.get, 'events/$eventId/payloads/$payloadId', ApiVersion.v2);
      return Payload.fromJson(json);
    } on ApiException catch (e) {
      // Server will throw a 500 if the ID is malformed. Remap to a better error.
      if (e.statusCode == 500) {
        final message = 'Payload ID is malformed. Please check the ID.';
        throw BadRequestException(message, 500, message);
      }
      // Otherwise, throw whatever the server threw.
      rethrow;
    }
  }

  /// Retrieve all [Payload]s for an [Event].
  Future<Payload> retrievePayloads(String eventId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'events/$eventId/payloads', ApiVersion.v2);
    return json.map<Payload>((json) => Payload.fromJson(json)).toList();
  }
}

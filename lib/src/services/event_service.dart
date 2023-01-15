import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/api/api_exception.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/payload.dart';
import 'package:easypost/src/parameters/events.dart';

/// The [EventService] handles events with the EasyPost API.
class EventService extends Service {
  EventService(Client client) : super(client);

  /// Retrieve an [Event].
  Future<Event> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'events/$id', ApiVersion.v2);
    return Event.fromJson(json);
  }

  /// List all [Event]s.
  Future<EventCollection> list({EventsAll? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'events', ApiVersion.v2,
        parameters: parameterMap);
    return EventCollection.fromJson(json);
  }

  /// Retrieve a [Payload] for an [Event].
  Future<Payload> retrievePayload(Event event, String payloadId) async {
    try {
      final json = await client.requestJson(HttpMethod.get,
          'events/${event.id}/payloads/$payloadId', ApiVersion.v2);
      return Payload.fromJson(json);
    } on ApiException catch (e) {
      // Server will throw a 500 if the ID is malformed. Remap to a better error.
      if (e.statusCode == 500) {
        throw Exception("Payload ID is malformed. Please check the ID.");
      }
      // Otherwise, throw whatever the server threw.
      rethrow;
    }
  }

  /// Retrieve all [Payload]s for an [Event].
  Future<Payload> retrievePayloads(Event event) async {
    final json = await client.requestJson(
        HttpMethod.get, 'events/${event.id}/payloads', ApiVersion.v2);
    return json.map<Payload>((json) => Payload.fromJson(json)).toList();
  }
}

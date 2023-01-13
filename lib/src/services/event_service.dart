import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/event.dart';
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
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'events', ApiVersion.v2,
        parameters: parameterMap);
    return EventCollection.fromJson(json);
  }
}

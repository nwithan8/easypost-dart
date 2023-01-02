import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/parameters/events.dart';

class EventService extends Service {
  EventService(Client client) : super(client);

  Future<Event> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'events/$id', ApiVersion.v2);
    return Event.fromJson(json);
  }

  Future<EventCollection> list({EventsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'events', ApiVersion.v2,
        parameters: parameterMap);
    return EventCollection.fromJson(json);
  }
}

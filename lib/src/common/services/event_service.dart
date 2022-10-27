import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/models/event.dart';

class EventService extends Service {
  EventService(Client client) : super(client);

  Future<Event> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'events/$id', ApiVersion.v2);
    return Event.fromJson(json);
  }

  Future<EventCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'events', ApiVersion.v2,
        parameters: filters);
    return EventCollection.fromJson(json);
  }
}

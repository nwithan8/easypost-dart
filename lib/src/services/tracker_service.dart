import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:easypost/src/parameters/trackers.dart';

class TrackerService extends Service {
  TrackerService(Client client) : super(client);

  Future<Tracker> create(TrackersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    return await client.requestJson(
      HttpMethod.post,
      'trackers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Tracker> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'trackers/$id',
      ApiVersion.v2,
    );
  }

  Future<TrackerCollection> list({TrackersAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client);
    final json = await client.requestJson(
        HttpMethod.get, 'trackers', ApiVersion.v2,
        parameters: parameterMap);
    return TrackerCollection.fromJson(json);
  }
}

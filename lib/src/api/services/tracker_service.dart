import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:easypost/src/api/parameters/trackers.dart';

/// The [TrackerService] handles trackers with the EasyPost API.
class TrackerService extends Service {
  TrackerService(Client client) : super(client);

  /// Creates a [Tracker].
  Future<Tracker> create(TrackersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'trackers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [Tracker].
  Future<Tracker> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'trackers/$id',
      ApiVersion.v2,
    );
  }

  /// Lists all [Tracker]s.
  Future<TrackerCollection> list({TrackersAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'trackers', ApiVersion.v2,
        parameters: parameterMap);
    return TrackerCollection.fromJson(json);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/parameters.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/calculations/rates.dart';

class TrackerService extends Service {
  TrackerService(Client client) : super(client);

  Future<Tracker> create(String carrier, String trackingCode) async {
    return await client.requestJson(
      HttpMethod.post,
      'trackers',
      ApiVersion.v2,
      parameters: {'tracker': {'carrier': carrier, 'tracking_code': trackingCode}},
    );
  }

  Future<Tracker> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'trackers/$id',
      ApiVersion.v2,
    );
  }

  Future<TrackerCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'trackers', ApiVersion.v2,
        parameters: filters);
    return TrackerCollection.fromJson(json);
  }
}

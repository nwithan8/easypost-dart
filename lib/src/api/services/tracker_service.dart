import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/trackers/list_trackers.dart';
import 'package:easypost/src/api/parameters/v2/trackers/create_tracker.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/tracker.dart';

/// The [TrackerService] handles trackers with the EasyPost API.
class TrackerService extends Service {
  TrackerService(Client client) : super(client);

  /// Creates a [Tracker].
  Future<Tracker> create(CreateTracker parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.post,
      'trackers',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Tracker.fromJson(json);
  }

  /// Retrieves a [Tracker].
  Future<Tracker> retrieve(String trackerId) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'trackers/$trackerId',
      ApiVersion.v2,
    );
    return Tracker.fromJson(json);
  }

  /// Lists all [Tracker]s.
  Future<TrackerCollection> list({ListTrackers? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'trackers', ApiVersion.v2,
        parameters: parameterMap);
    final collection = TrackerCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [TrackerCollection].
  Future<TrackerCollection> getNextPage(TrackerCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListTrackers? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.trackers, pageSize: pageSize)
    as Future<TrackerCollection>;
  }

  /// Refreshes a [Tracker].
  Future<Tracker> refresh(String trackerId) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'trackers/$trackerId/refresh',
      ApiVersion.v2,
    );
    return Tracker.fromJson(json);
  }
}

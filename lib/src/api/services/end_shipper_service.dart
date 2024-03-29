import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/end_shippers/create_end_shipper.dart';
import 'package:easypost/src/api/parameters/v2/end_shippers/list_end_shippers.dart';
import 'package:easypost/src/api/parameters/v2/end_shippers/update_end_shipper.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/end_shipper.dart';

/// The [EndShipperService] handles end shippers with the EasyPost API.
class EndShipperService extends Service {
  EndShipperService(Client client) : super(client);

  /// Creates an [EndShipper].
  Future<EndShipper> create(CreateEndShipper parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'end_shippers', ApiVersion.v2,
        parameters: parameterMap);
    return EndShipper.fromJson(json);
  }

  /// Retrieves an [EndShipper].
  Future<EndShipper> retrieve(String endShipperId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'end_shippers/$endShipperId', ApiVersion.v2);
    return EndShipper.fromJson(json);
  }

  /// Lists all [EndShipper]s.
  Future<EndShipperCollection> list({ListEndShippers? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'end_shippers', ApiVersion.v2,
        parameters: parameterMap);
    final collection = EndShipperCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [EndShipperCollection].
  Future<EndShipperCollection> getNextPage(EndShipperCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListEndShippers? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.endShippers,
        pageSize: pageSize) as Future<EndShipperCollection>;
  }

  /// Updates an [EndShipper].
  Future<EndShipper> update(
      String endShipperId, UpdateEndShipper parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.put, 'end_shippers/$endShipperId', ApiVersion.v2,
        parameters: parameterMap);
    return EndShipper.fromJson(json);
  }
}

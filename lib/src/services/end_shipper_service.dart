import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/end_shipper.dart';
import 'package:easypost/src/parameters/end_shippers.dart';

/// The [EndShipperService] handles end shippers with the EasyPost API.
class EndShipperService extends Service {
  EndShipperService(Client client) : super(client);

  /// Creates an [EndShipper].
  Future<EndShipper> create(EndShippersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'end_shippers', ApiVersion.v2,
        parameters: parameterMap);
    return EndShipper.fromJson(json);
  }

  /// Retrieves an [EndShipper].
  Future<EndShipper> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'end_shippers/$id', ApiVersion.v2);
    return EndShipper.fromJson(json);
  }

  /// Lists all [EndShipper]s.
  Future<EndShipperCollection> list({EndShippersAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'end_shippers', ApiVersion.v2,
        parameters: parameterMap);
    return EndShipperCollection.fromJson(json);
  }

  /// Updates an [EndShipper].
  Future<EndShipper> update(
      EndShipper endShipper, EndShippersUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.put, 'end_shippers/${endShipper.id}', ApiVersion.v2,
        parameters: parameterMap);
    return EndShipper.fromJson(json);
  }
}

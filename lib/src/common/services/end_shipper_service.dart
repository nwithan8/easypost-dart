import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/end_shipper.dart';

class EndShipperService extends Service {
  EndShipperService(Client client) : super(client);

  Future<EndShipper> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'end_shippers', ApiVersion.v2,
        parameters: data.wrap(['address']));
    return EndShipper.fromJson(json);
  }

  Future<EndShipper> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'end_shippers/$id', ApiVersion.v2);
    return EndShipper.fromJson(json);
  }

  Future<EndShipperCollection> list({Map<String, dynamic>? filters}) async {
    final json =
        await client.requestJson(HttpMethod.get, 'end_shippers', ApiVersion.v2, parameters: filters);
    return EndShipperCollection.fromJson(json);
  }

  Future<EndShipper> update(
      EndShipper endShipper, Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.put, 'end_shippers/${endShipper.id}', ApiVersion.v2,
        parameters: data.wrap(['address']));
    return EndShipper.fromJson(json);
  }
}

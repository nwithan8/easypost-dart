import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/scan_form.dart';
import 'package:easypost/src/common/models/shipment.dart';
import 'package:easypost/src/common/models/rate.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/calculations/rates.dart';

class ScanFormService extends Service {
  ScanFormService(Client client) : super(client);

  Future<ScanForm> create(List<Shipment> shipments) async {
    List<Map<String, dynamic>> shipmentIds = [];

    for (Shipment shipment in shipments) {
      shipmentIds.add({'id': shipment.id});
    }

    return await client.requestJson(
      HttpMethod.post,
      'scan_forms',
      ApiVersion.v2,
      parameters: {'shipments': shipmentIds},
    );
  }

  Future<ScanForm> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'scan_forms/$id',
      ApiVersion.v2,
    );
  }

  Future<ScanFormCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'scan_forms', ApiVersion.v2,
        parameters: filters);
    return ScanFormCollection.fromJson(json);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/batch.dart';
import 'package:easypost/src/common/models/shipment.dart';
import 'package:easypost/src/common/http/http_method.dart';

/// The [BatchService] handles Batches with the EasyPost API.
class BatchService extends Service {
  BatchService(Client client) : super(client);

  /// Creates an Batch.
  Future<Batch> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'batches', ApiVersion.v2,
        parameters: data.wrap(['batch']));
    return Batch.fromJson(json);
  }

  /// Retrieves an Batch.
  Future<Batch> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'batches/$id', ApiVersion.v2);
    return Batch.fromJson(json);
  }

  /// Lists all Batches.
  Future<BatchCollection> list({Map<String, dynamic>? filters}) async {
    final json =
        await client.requestJson(HttpMethod.get, 'batches', ApiVersion.v2, parameters: filters);
    return BatchCollection.fromJson(json);
  }

  /// Add shipments to a Batch.
  Future<Batch> addShipments(Batch batch, List<Shipment> shipments) async {
    List<Map<String, dynamic>> shipmentIds = [];

    for (Shipment shipment in shipments) {
      shipmentIds.add({'id': shipment.id});
    }

    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/add_shipments', ApiVersion.v2,
        parameters: {'shipments': shipmentIds});
    return Batch.fromJson(json);
  }

  /// Remove shipments from a Batch.
  Future<Batch> removeShipments(Batch batch, List<Shipment> shipments) async {
    List<Map<String, dynamic>> shipmentIds = [];

    for (Shipment shipment in shipments) {
      shipmentIds.add({'id': shipment.id});
    }

    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/remove_shipments', ApiVersion.v2,
        parameters: {'shipments': shipmentIds});
    return Batch.fromJson(json);
  }

  /// Purchase a Batch.
  Future<Batch> purchase(Batch batch) async {
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/buy', ApiVersion.v2);
    return Batch.fromJson(json);
  }

  /// Generate a Batch's label.
  Future<Batch> generateLabel(Batch batch, String fileFormat) async {
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/label', ApiVersion.v2,
        parameters: {'file_format': fileFormat});
    return Batch.fromJson(json);
  }

  /// Generate a Batch's scan form.
  Future<Batch> generateScanForm(Batch batch, String fileFormat) async {
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/scan_form', ApiVersion.v2,
        parameters: {'file_format': fileFormat});
    return Batch.fromJson(json);
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/batches.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/batch.dart';
import 'package:easypost/src/models/shipment.dart';

/// The [BatchService] handles batches with the EasyPost API.
class BatchService extends Service {
  BatchService(Client client) : super(client);

  /// Creates a [Batch].
  Future<Batch> create(BatchesCreate parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'batches', ApiVersion.v2,
        parameters: parameterMap);
    return Batch.fromJson(json);
  }

  /// Retrieves a [Batch].
  Future<Batch> retrieve(String id) async {
    final json =
        await client.requestJson(HttpMethod.get, 'batches/$id', ApiVersion.v2);
    return Batch.fromJson(json);
  }

  /// Lists all [Batch]es.
  Future<BatchCollection> list({BatchesAll? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'batches', ApiVersion.v2,
        parameters: parameterMap);
    return BatchCollection.fromJson(json);
  }

  /// Adds [Shipment]s to a [Batch].
  Future<Batch> addShipments(
      Batch batch, BatchesUpdateShipments parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/add_shipments', ApiVersion.v2,
        parameters: parameterMap);
    return Batch.fromJson(json);
  }

  /// Removes [Shipment]s from a [Batch].
  Future<Batch> removeShipments(
      Batch batch, BatchesUpdateShipments parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);

    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/remove_shipments', ApiVersion.v2,
        parameters: parameterMap);
    return Batch.fromJson(json);
  }

  /// Purchases a [Batch].
  Future<Batch> purchase(Batch batch) async {
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/buy', ApiVersion.v2);
    return Batch.fromJson(json);
  }

  /// Generates a [Batch]'s label.
  Future<Batch> generateLabel(
      Batch batch, BatchesCreateDocument parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/label', ApiVersion.v2,
        parameters: parameterMap);
    return Batch.fromJson(json);
  }

  /// Generates a [Batch]'s scan form.
  Future<Batch> generateScanForm(
      Batch batch, BatchesCreateDocument parameters) async {
    Map<String, dynamic>? parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'batches/${batch.id}/scan_form', ApiVersion.v2,
        parameters: parameterMap);
    return Batch.fromJson(json);
  }
}

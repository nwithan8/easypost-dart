import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/calculations/rates.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/models/smart_rate.dart';
import 'package:easypost/src/models/smart_rate_accuracy.dart';
import 'package:easypost/src/parameters/shipments.dart';

/// The [ShipmentService] handles shipments with the EasyPost API.
class ShipmentService extends Service {
  ShipmentService(Client client) : super(client);

  /// Creates a shipment.
  Future<Shipment> create(ShipmentsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Retrieves a shipment.
  Future<Shipment> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$id', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Lists all shipments.
  Future<ShipmentCollection> list({ShipmentsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments', ApiVersion.v2,
        parameters: parameterMap);
    return ShipmentCollection.fromJson(json);
  }

  Future<List<SmartRate>> getSmartRates(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/smartrate', ApiVersion.v2,
        rootElement: "result");
    return json.map<SmartRate>((e) => SmartRate.fromJson(e)).toList();
  }

  Future<Shipment> buy(Shipment shipment, ShipmentsBuy parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);

    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  Future<Shipment> generateLabel(
      Shipment shipment, ShipmentsCreateDocument parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/label', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  Future<Shipment> insure(Shipment shipment, ShipmentsInsure parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/insure', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  Future<Shipment> refund(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/refund', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  Future<Shipment> refreshRates(Shipment shipment,
      {ShipmentsGenerateRates? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/rates', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  Rate getLowestRateFor(
    Shipment shipment, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    if (shipment.rates == null) {
      throw Exception('Shipment has no rates');
    }
    return getLowestRate(shipment.rates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }

  Future<SmartRate> getLowestSmartRateFor(Shipment shipment, int deliveryDays,
      SmartRateAccuracy deliveryAccuracy) async {
    List<SmartRate> smartRates = await getSmartRates(shipment);

    if (smartRates.isEmpty) {
      throw Exception('No smart rates available.');
    }

    return getLowestSmartRate(smartRates, deliveryDays, deliveryAccuracy);
  }
}

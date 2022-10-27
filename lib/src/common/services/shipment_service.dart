import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/models/shipment.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/smart_rate.dart';
import 'package:easypost/src/common/models/rate.dart';
import 'package:easypost/src/common/models/smart_rate_accuracy.dart';
import 'package:easypost/src/common/calculations/rates.dart';

/// The [ShipmentService] handles shipments with the EasyPost API.
class ShipmentService extends Service {
  ShipmentService(Client client) : super(client);

  /// Creates a shipment.
  Future<Shipment> create(Map<String, dynamic> data,
      {bool withCarbonOffset = false}) async {
    data = data.wrap(['shipment']);
    data['carbon_offset'] = withCarbonOffset;

    final json = await client.requestJson(
        HttpMethod.post, 'shipments', ApiVersion.v2,
        parameters: data);
    return Shipment.fromJson(json);
  }

  /// Retrieves a shipment.
  Future<Shipment> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$id', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Lists all shipments.
  Future<ShipmentCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments', ApiVersion.v2,
        parameters: filters);
    return ShipmentCollection.fromJson(json);
  }

  Future<List<SmartRate>> getSmartRates(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/smartrate', ApiVersion.v2,
        rootElement: "result");
    return json.map<SmartRate>((e) => SmartRate.fromJson(e)).toList();
  }

  Future<Shipment> buy(Shipment shipment, Rate rate,
      {double? insuranceValue,
      bool? withCarbonOffset = false,
      String? endShipperId}) async {
    Map<String, dynamic> parameters = {
      'rate': {'id': rate.id},
      'insurance': insuranceValue ?? "",
      'carbon_offset': withCarbonOffset
    };

    if (endShipperId != null) {
      parameters['end_shipper_id'] = endShipperId;
    }

    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/buy', ApiVersion.v2,
        parameters: parameters);
    return Shipment.fromJson(json);
  }

  Future<Shipment> generateLabel(Shipment shipment, String fileFormat) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/label', ApiVersion.v2,
        parameters: {'file_format': fileFormat});
    return Shipment.fromJson(json);
  }

  Future<Shipment> insure(Shipment shipment, double amount) async {
    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/insure', ApiVersion.v2,
        parameters: {'amount': amount});
    return Shipment.fromJson(json);
  }

  Future<Shipment> refund(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/refund', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  Future<Shipment> refreshRates(Shipment shipment,
      {Map<String, dynamic>? parameters, bool withCarbonOffset = false}) async {
    parameters = parameters ?? {};

    parameters['carbon_offset'] = withCarbonOffset;

    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/rates', ApiVersion.v2,
        parameters: parameters);
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

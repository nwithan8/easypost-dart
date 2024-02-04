import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/shipments/list_shipments.dart';
import 'package:easypost/src/api/parameters/v2/shipments/buy_shipment.dart';
import 'package:easypost/src/api/parameters/v2/shipments/create_shipment.dart';
import 'package:easypost/src/api/parameters/v2/shipments/create_shipment_document.dart';
import 'package:easypost/src/api/parameters/v2/shipments/insure_shipment.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
import 'package:easypost/src/exceptions/resource_not_found_exception.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/models/smart_rate.dart';
import 'package:easypost/src/enums/smart_rate_accuracy.dart';
import 'package:easypost/src/tools/rates.dart';

/// The [ShipmentService] handles shipments with the EasyPost API.
class ShipmentService extends Service {
  ShipmentService(Client client) : super(client);

  /// Creates a [Shipment].
  Future<Shipment> create(CreateShipment parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Retrieves a [Shipment].
  Future<Shipment> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$id', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Lists all [Shipment]s.
  Future<ShipmentCollection> list({ListShipments? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments', ApiVersion.v2,
        parameters: parameterMap);
    final collection = ShipmentCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [ShipmentCollection].
  Future<ShipmentCollection> getNextPage(ShipmentCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListShipments? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.shipments, pageSize: pageSize)
    as Future<ShipmentCollection>;
  }

  /// Retrieves all [SmartRate]s for a [Shipment].
  Future<List<SmartRate>> getSmartRates(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/smartrate', ApiVersion.v2,
        rootElement: "result");
    return json.map<SmartRate>((e) => SmartRate.fromJson(e)).toList();
  }

  /// Purchases a [Shipment].
  Future<Shipment> buy(Shipment shipment, BuyShipment parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);

    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Generates a [Shipment] label.
  Future<Shipment> generateLabel(
      Shipment shipment, CreateShipmentDocument parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/label', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Insures a [Shipment].
  Future<Shipment> insure(Shipment shipment, InsureShipment parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments/${shipment.id}/insure', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Refunds a [Shipment].
  Future<Shipment> refund(Shipment shipment) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/${shipment.id}/refund', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Refreshes the [Rate]s for a [Shipment].
  Future<Shipment> refreshRates(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$id/rates', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Calculates the lowest [Rate] for a [Shipment].
  Rate getLowestRateFor(
    Shipment shipment, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    if (shipment.rates == null) {
      throw MissingPropertyException.generate(shipment.toString(), 'rates');
    }
    return getLowestRate(shipment.rates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }

  /// Calculates the lowest [SmartRate] for a [Shipment].
  Future<SmartRate> getLowestSmartRateFor(Shipment shipment, int deliveryDays,
      SmartRateAccuracy deliveryAccuracy) async {
    List<SmartRate> smartRates = await getSmartRates(shipment);

    if (smartRates.isEmpty) {
      throw ResourceNotFoundException('No smart rates available.');
    }

    return getLowestSmartRate(smartRates, deliveryDays, deliveryAccuracy);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/internal/conversions.dart';

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
  Future<Shipment> retrieve(String shipmentId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$shipmentId', ApiVersion.v2);
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
  Future<List<SmartRate>> getSmartRates(String shipmentId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$shipmentId/smartrate', ApiVersion.v2,
        rootElement: "result");
    return json.map<SmartRate>((e) => SmartRate.fromJson(e)).toList();
  }

  /// Purchases a [Shipment].
  Future<Shipment> buy(String shipmentId, BuyShipment parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);

    final json = await client.requestJson(
        HttpMethod.post, 'shipments/$shipmentId/buy', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Generates a [Shipment] label.
  Future<Shipment> generateLabel(
      String shipmentId, CreateShipmentLabel parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$shipmentId/label', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Generates a [Shipment] form.
  Future<Shipment> generateForm(
      String shipmentId, CreateShipmentForm parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments/$shipmentId/forms', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Insures a [Shipment].
  Future<Shipment> insure(String shipmentId, InsureShipment parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'shipments/$shipmentId/insure', ApiVersion.v2,
        parameters: parameterMap);
    return Shipment.fromJson(json);
  }

  /// Refunds a [Shipment].
  Future<Shipment> refund(String shipmentId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$shipmentId/refund', ApiVersion.v2);
    return Shipment.fromJson(json);
  }

  /// Refreshes the [Rate]s for a [Shipment].
  Future<List<ShipmentRate>> refreshRates(String shipmentId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'shipments/$shipmentId/rates', ApiVersion.v2);
    List<dynamic> rateData = json['rates'];
    return rateData.map((e) => ShipmentRate.fromJson(e)).toList();
  }

  /// Retrieve the estimated delivery dates for a [Shipment].
  Future<List<RateWithEstimatedDeliveryDate>> getEstimatedDeliveryDates(
      String shipmentId, DateTime plannedShipDate) async {
    Map<String, dynamic> parameterMap = {
      'planned_ship_date': dateTimeToStringYYYYMMDD(plannedShipDate),
    };
    final json = await client.requestJson(HttpMethod.get,
        'shipments/$shipmentId/smartrate/delivery_date', ApiVersion.v2,
        parameters: parameterMap);
    List<dynamic> rateData = json['rates'];
    return rateData
        .map<RateWithEstimatedDeliveryDate>(
            (e) => RateWithEstimatedDeliveryDate.fromJson(e))
        .toList();
  }

  /// Calculates the lowest [Rate] for a [Shipment].
  ShipmentRate? getLowestRateFor(
    Shipment shipment, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    if (shipment.rates == null) {
      throw MissingPropertyException.generate(shipment.toString(), 'rates');
    }
    QuotedRate lowestQuotedRate = getLowestRateInternal(shipment.rates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
    return shipment.associatedShipmentRate(lowestQuotedRate, lockPrice: true);
  }

  /// Calculates the lowest [SmartRate] for a [Shipment].
  Future<SmartRate> getLowestSmartRateFor(Shipment shipment, int deliveryDays,
      SmartRateAccuracy deliveryAccuracy) async {
    List<SmartRate> smartRates = await getSmartRates(shipment.id);

    if (smartRates.isEmpty) {
      throw ResourceNotFoundException('No smart rates available.');
    }

    return getLowestSmartRate(smartRates, deliveryDays, deliveryAccuracy);
  }
}

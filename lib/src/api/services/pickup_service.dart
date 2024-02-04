import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/pickups/list_pickups.dart';
import 'package:easypost/src/api/parameters/v2/pickups/create_pickup.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
import 'package:easypost/src/models/pickup.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/tools/rates.dart';

/// The [PickupService] handles pickups with the EasyPost API.
class PickupService extends Service {
  PickupService(Client client) : super(client);

  /// Creates a [Pickup].
  Future<Pickup> create(CreatePickup parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.post,
      'pickups',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Pickup.fromJson(json);
  }

  /// Retrieves a [Pickup].
  Future<Pickup> retrieve(String id) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'pickups/$id',
      ApiVersion.v2,
    );
    return Pickup.fromJson(json);
  }

  /// Lists all [Pickup]s.
  Future<PickupCollection> list({ListPickups? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'pickups', ApiVersion.v2,
        parameters: parameterMap);
    final collection = PickupCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [PickupCollection].
  Future<PickupCollection> getNextPage(PickupCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListPickups? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.pickups, pageSize: pageSize)
    as Future<PickupCollection>;
  }

  /// Purchases a [Pickup].
  Future<Pickup> buy(String id, Rate rate) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/$id/buy', ApiVersion.v2,
        parameters: {'carrier': rate.carrier, 'service': rate.service});
    return Pickup.fromJson(json);
  }

  /// Cancels a [Pickup].
  Future<Pickup> cancel(String id) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/$id/cancel', ApiVersion.v2);
    return Pickup.fromJson(json);
  }

  /// Calculates the lowest [Rate] for a [Pickup].
  PickupRate getLowestRateFor(
    Pickup pickup, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    if (pickup.pickupRates == null) {
      throw MissingPropertyException('Order has no rates');
    }
    Rate rate = getLowestRate(pickup.pickupRates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
    return pickup.associatedPickupRate(rate);
  }
}

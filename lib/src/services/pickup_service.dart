import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/calculations/rates.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/pickup.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/parameters/pickups.dart';

/// The [PickupService] handles pickups with the EasyPost API.
class PickupService extends Service {
  PickupService(Client client) : super(client);

  /// Creates a [Pickup].
  Future<Pickup> create(PickupsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'pickups',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [Pickup].
  Future<Pickup> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'pickups/$id',
      ApiVersion.v2,
    );
  }

  /// Lists all [Pickup]s.
  Future<PickupCollection> list({PickupsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'pickups', ApiVersion.v2,
        parameters: parameterMap);
    return PickupCollection.fromJson(json);
  }

  /// Purchases a [Pickup].
  Future<Pickup> buy(Pickup pickup, Rate rate) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/${pickup.id}/buy', ApiVersion.v2,
        parameters: {'carrier': rate.carrier, 'service': rate.service});
    return Pickup.fromJson(json);
  }

  /// Cancels a [Pickup].
  Future<Pickup> cancel(Pickup pickup) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/${pickup.id}/cancel', ApiVersion.v2);
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
      throw Exception('Order has no rates');
    }
    Rate rate = getLowestRate(pickup.pickupRates!,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
    return pickup.associatedPickupRate(rate);
  }
}

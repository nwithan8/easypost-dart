import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/calculations/rates.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/pickup.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/parameters/pickups.dart';

class PickupService extends Service {
  PickupService(Client client) : super(client);

  Future<Pickup> create(PickupsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    return await client.requestJson(
      HttpMethod.post,
      'pickups',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Pickup> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'pickups/$id',
      ApiVersion.v2,
    );
  }

  Future<Pickup> buy(Pickup pickup, Rate rate) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/${pickup.id}/buy', ApiVersion.v2,
        parameters: {'carrier': rate.carrier, 'service': rate.service});
    return Pickup.fromJson(json);
  }

  Future<Pickup> cancel(Pickup pickup) async {
    final json = await client.requestJson(
        HttpMethod.post, 'pickups/${pickup.id}/cancel', ApiVersion.v2);
    return Pickup.fromJson(json);
  }

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

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/rate.dart';

/// The [RateService] handles rates with the EasyPost API.
class RateService extends Service {
  RateService(Client client) : super(client);

  /// Retrieves a [Rate].
  Future<Rate> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'rates/$id',
      ApiVersion.v2,
    );
  }

  /// Calculates the lowest [Rate].
  Rate getLowestRate(
    List<Rate> rates, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    return getLowestRate(rates,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }
}

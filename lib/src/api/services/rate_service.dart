import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/api/parameters/v2/rates/retrieve_rates.dart';

/// The [RateService] handles rates with the EasyPost API.
class RateService extends Service {
  RateService(Client client) : super(client);

  /// Retrieve a list of [Rate]s for a potential [Shipment].
  Future<List<Rate>> retrieveRates(RetrieveRates parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'rates', ApiVersion.beta,
        parameters: parameterMap);
    return json.map<Rate>((e) => Rate.fromJson(e)).toList();
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

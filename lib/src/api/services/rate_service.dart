import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/rates/retrieve_quoted_rates.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/tools/rates.dart';

/// The [RateService] handles rates with the EasyPost API.
class RateService extends Service {
  RateService(Client client) : super(client);

  /// Retrieve a list of [Rate]s for a potential [Shipment].
  Future<List<QuotedRate>?> retrieveRateQuotes(RetrieveQuotedRates parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'rates', ApiVersion.beta,
        parameters: parameterMap);
    final shipment = Shipment.fromJson(json);
    return shipment.rates;
  }

  /// Calculates the lowest [Rate].
  QuotedRate getLowestRate(
    List<QuotedRate> rates, {
    List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices,
  }) {
    return getLowestRateInternal(rates,
        includeCarriers: includeCarriers,
        excludeCarriers: excludeCarriers,
        includeServices: includeServices,
        excludeServices: excludeServices);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/rate.dart';

class RateService extends Service {
  RateService(Client client) : super(client);

  Future<Rate> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'rates/$id',
      ApiVersion.v2,
    );
  }

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

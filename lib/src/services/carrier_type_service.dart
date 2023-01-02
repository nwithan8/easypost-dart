import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/carrier_type.dart';
import 'package:easypost/src/parameters/_generic.dart';

class CarrierTypeService extends Service {
  CarrierTypeService(Client client) : super(client);

  Future<List<CarrierType>> list({All? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_types', ApiVersion.v2,
        parameters: parameterMap);
    return json.map<CarrierType>((json) => CarrierType.fromJson(json)).toList();
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/models/carrier_type.dart';

class CarrierTypeService extends Service {
  CarrierTypeService(Client client) : super(client);

  Future<List<CarrierType>> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_types', ApiVersion.v2, parameters: filters);
    return json.map<CarrierType>((json) => CarrierType.fromJson(json)).toList();
  }
}

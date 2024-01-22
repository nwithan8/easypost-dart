import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/carrier_types/all_carrier_types.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/carrier_type.dart';

/// The [CarrierTypeService] handles carrier types with the EasyPost API.
class CarrierTypeService extends Service {
  CarrierTypeService(Client client) : super(client);

  /// List all [CarrierType]s.
  Future<List<CarrierType>> list({ListCarrierTypes? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_types', ApiVersion.v2,
        parameters: parameterMap);
    return json.map<CarrierType>((json) => CarrierType.fromJson(json)).toList();
  }
}

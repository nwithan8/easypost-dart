import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/carrier_type.dart';

/// The [CarrierTypeService] handles carrier types with the EasyPost API.
class CarrierTypeService extends Service {
  CarrierTypeService(Client client) : super(client);

  /// List all [CarrierType]s.
  // This is not paginated.
  Future<List<CarrierType>> list() async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_types', ApiVersion.v2);
    return json.map<CarrierType>((json) => CarrierType.fromJson(json)).toList();
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/carrier_info/retrieve_info.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/carrier_info.dart';

/// The [CarrierInfoService] handles carrier information with the EasyPost API.
class CarrierInfoService extends Service {
  CarrierInfoService(Client client) : super(client);

  /// Retrieve information about specific carriers.
  Future<CarrierInfo> retrieveInfo(RetrieveInfo parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'metadata/carriers', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierInfo.fromJson(json);
  }
}

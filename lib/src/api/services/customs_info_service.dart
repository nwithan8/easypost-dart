import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/customs_info/create_customs_info.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/customs_info.dart';

/// The [CustomsInfoService] handles customs info with the EasyPost API.
class CustomsInfoService extends Service {
  CustomsInfoService(Client client) : super(client);

  /// Creates a [CustomsInfo].
  Future<CustomsInfo> create(CreateCustomsInfo parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'customs_infos', ApiVersion.v2,
        parameters: parameterMap);
    return CustomsInfo.fromJson(json);
  }

  /// Retrieves a [CustomsInfo].
  Future<CustomsInfo> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'customs_infos/$id', ApiVersion.v2);
    return CustomsInfo.fromJson(json);
  }
}

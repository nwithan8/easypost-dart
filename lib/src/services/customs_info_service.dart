import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/parameters/customs_info.dart';

class CustomsInfoService extends Service {
  CustomsInfoService(Client client) : super(client);

  Future<CustomsInfo> create(CustomsInfoCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(
        HttpMethod.post, 'customs_infos', ApiVersion.v2,
        parameters: parameterMap);
    return CustomsInfo.fromJson(json);
  }

  Future<CustomsInfo> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'customs_infos/$id', ApiVersion.v2);
    return CustomsInfo.fromJson(json);
  }
}

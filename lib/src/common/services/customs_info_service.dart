import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/customs_info.dart';

class CustomsInfoService extends Service {
  CustomsInfoService(Client client) : super(client);

  Future<CustomsInfo> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'customs_infos', ApiVersion.v2,
        parameters: data.wrap(['customs_info']));
    return CustomsInfo.fromJson(json);
  }

  Future<CustomsInfo> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'customs_infos/$id', ApiVersion.v2);
    return CustomsInfo.fromJson(json);
  }
}

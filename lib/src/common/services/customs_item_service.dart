import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/customs_item.dart';

class CustomsItemService extends Service {
  CustomsItemService(Client client) : super(client);

  Future<CustomsItem> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'customs_items', ApiVersion.v2,
        parameters: data.wrap(['customs_item']));
    return CustomsItem.fromJson(json);
  }

  Future<CustomsItem> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'customs_items/$id', ApiVersion.v2);
    return CustomsItem.fromJson(json);
  }
}

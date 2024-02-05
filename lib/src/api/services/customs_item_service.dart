import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/customs_items/create_customs_item.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/customs_item.dart';

/// The [CustomsItemService] handles customs items with the EasyPost API.
class CustomsItemService extends Service {
  CustomsItemService(Client client) : super(client);

  /// Creates a [CustomsItem].
  Future<CustomsItem> create(CreateCustomsItem parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'customs_items', ApiVersion.v2,
        parameters: parameterMap);
    return CustomsItem.fromJson(json);
  }

  /// Retrieves a [CustomsItem].
  Future<CustomsItem> retrieve(String customsItemId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'customs_items/$customsItemId', ApiVersion.v2);
    return CustomsItem.fromJson(json);
  }
}

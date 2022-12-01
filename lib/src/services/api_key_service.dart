import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/models/api_key.dart';
import 'package:easypost/src/http/http_method.dart';

/// The [ApiKeyService] handles ApiKeys with the EasyPost API.
class ApiKeyService extends Service {
  ApiKeyService(Client client) : super(client);

  /// Lists all ApiKeys.
  Future<ApiKeyCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(HttpMethod.get,'api_keys', ApiVersion.v2, parameters: filters);
    return ApiKeyCollection.fromJson(json);
  }
}

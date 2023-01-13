import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/api_key.dart';

/// The [ApiKeyService] handles API keys with the EasyPost API.
class ApiKeyService extends Service {
  ApiKeyService(Client client) : super(client);

  /// Lists all [ApiKey]s.
  Future<ApiKeyCollection> list() async {
    final json = await client.requestJson(HttpMethod.get,'api_keys', ApiVersion.v2);
    return ApiKeyCollection.fromJson(json);
  }
}

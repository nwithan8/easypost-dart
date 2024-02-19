import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/api_keys/list_api_keys.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/api_key.dart';

/// The [ApiKeyService] handles API keys with the EasyPost API.
class ApiKeyService extends Service {
  ApiKeyService(Client client) : super(client);

  /// Lists all [ApiKey]s.
  // This is not paginated.
  Future<ApiKeyCollection> list({ListApiKeys? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'api_keys', ApiVersion.v2,
        parameters: parameterMap);
    return ApiKeyCollection.fromJson(json);
  }

  /// Retrieve all [ApiKey]s for a given user.
  Future<List<ApiKey>?> retrieveApiKeysForUser(String userId) async {
    final data = await list();

    if (data.id == userId) {
      return data.keys;
    }

    if (data.children != null) {
      for (var child in data.children!) {
        if (child.id == userId) {
          return child.keys;
        }
      }
    }

    return null;
  }
}

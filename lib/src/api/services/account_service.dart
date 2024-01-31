import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/user.dart';
import 'package:easypost/src/api/parameters/v2/accounts/change_password.dart';

/// The [AccountService] handles account settings via the EasyPost API.
class AccountService extends Service {
  AccountService(Client client) : super(client);

  /// Change account password.
  Future<bool> changePassword(ChangePassword parameters) async {
    // Get the current user
    final userJson = await client.requestJson(
      HttpMethod.get,
      'users',
      ApiVersion.v2,
    );
    final user = User.fromJson(userJson);

    Map<String, dynamic> parameterMap =
    parameters.constructJson(client: client);
    return await client.request(
      HttpMethod.put,
      'users/${user.id}',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }
}

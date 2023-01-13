import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/user.dart';
import 'package:easypost/src/parameters/users.dart';

/// The [UserService] handles users with the EasyPost API.
class UserService extends Service {
  UserService(Client client) : super(client);

  /// Creates a child [User].
  Future<User> createChild(UsersCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'users',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [User].
  Future<User> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'users/$id',
      ApiVersion.v2,
    );
  }


  /// Retrieves the current authenticated [User].
  Future<User> retrieveMe() async {
    return await client.requestJson(
      HttpMethod.get,
      'users',
      ApiVersion.v2,
    );
  }

  /// Updates a [User].
  Future<User> update(User user, UsersUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.put,
      'users/${user.id}',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }


  /// Update the [Brand] of a [User].
  Future<User> updateBrand(User user, UsersUpdateBrand parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.put,
      'users/${user.id}/brand',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Deletes a [User].
  Future<bool> delete(User user) async {
    return await client.requestJson(
      HttpMethod.delete,
      'users/${user.id}',
      ApiVersion.v2,
    );
  }
}

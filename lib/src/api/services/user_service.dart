import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/users/create_user.dart';
import 'package:easypost/src/api/parameters/v2/users/update_brand.dart';
import 'package:easypost/src/api/parameters/v2/users/update_user.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/user.dart';

/// The [UserService] handles users with the EasyPost API.
class UserService extends Service {
  UserService(Client client) : super(client);

  /// Creates a child [User].
  Future<User> createChild(CreateUser parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'users',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Retrieves a [User].
  Future<User> retrieve(String id) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'users/$id',
      ApiVersion.v2,
    );
    return User.fromJson(json);
  }

  /// Retrieves the current authenticated [User].
  Future<User> retrieveMe() async {
    final json = await client.requestJson(
      HttpMethod.get,
      'users',
      ApiVersion.v2,
    );
    return User.fromJson(json);
  }

  /// Updates a [User].
  Future<User> update(User user, UpdateUser parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.put,
      'users/${user.id}',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Update the [Brand] of a [User].
  Future<User> updateBrand(User user, UpdateBrand parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.put,
      'users/${user.id}/brand',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Deletes a [User].
  Future<bool> delete(User user) async {
    return await client.request(
      HttpMethod.delete,
      'users/${user.id}',
      ApiVersion.v2,
    );
  }
}

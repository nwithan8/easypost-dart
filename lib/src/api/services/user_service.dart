import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/users/create_user.dart';
import 'package:easypost/src/api/parameters/v2/users/update_brand.dart';
import 'package:easypost/src/api/parameters/v2/users/update_user.dart';
import 'package:easypost/src/api/parameters/v2/users/list_child_users.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/user.dart';
import 'package:easypost/src/models/brand.dart';

/// The [UserService] handles users with the EasyPost API.
class UserService extends Service {
  UserService(Client client) : super(client);

  /// Creates a child [User].
  Future<User> createChildUser(CreateUser parameters) async {
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
  Future<User> retrieveChildUser(String id) async {
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

  /// List all child [User]s.
  // TODO: Get next page for all list methods
  Future<ChildUserCollection> listChildUsers({ListChildUsers? parameters}) async {
    Map<String, dynamic>? parameterMap =
    parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'users/children', ApiVersion.v2,
        parameters: parameterMap);
    return ChildUserCollection.fromJson(json);
  }

  /// Updates a [User].
  Future<User> updateUser(User user, UpdateUser parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.patch,
      'users/${user.id}',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Updates the current authenticated [User].
  Future<User> updateMe(UpdateUser parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.patch,
      'users',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Deletes a child [User].
  Future<bool> deleteChildUser(User user) async {
    return await client.request(
      HttpMethod.delete,
      'users/${user.id}',
      ApiVersion.v2,
    );
  }

  /// Update the [Brand] of a [User].
  Future<User> updateBrand(User user, UpdateBrand parameters) async {
    Map<String, dynamic> parameterMap =
    parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.patch,
      'users/${user.id}/brand',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return User.fromJson(json);
  }

  /// Retrieves the [Brand] of a [User].
  Future<Brand> retrieveBrand(User user) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'users/${user.id}/brand',
      ApiVersion.v2,
    );
    return Brand.fromJson(json);
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/users/create_user.dart';
import 'package:easypost/src/api/parameters/v2/users/list_child_users.dart';
import 'package:easypost/src/api/parameters/v2/users/update_brand.dart';
import 'package:easypost/src/api/parameters/v2/users/update_user.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/brand.dart';
import 'package:easypost/src/models/user.dart';

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
  Future<User> retrieveChildUser(String userId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'users/$userId',
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
  Future<ChildUserCollection> listChildUsers(
      {ListChildUsers? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'users/children', ApiVersion.v2,
        parameters: parameterMap);
    final collection = ChildUserCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [ChildUserCollection].
  Future<ChildUserCollection> getNextPageOfChildUsers(
      ChildUserCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListChildUsers? parameters) {
      return listChildUsers(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(retrieveNextPageFunction, collection.children,
        pageSize: pageSize) as Future<ChildUserCollection>;
  }

  /// Updates a [User].
  Future<User> updateUser(String userId, UpdateUser parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.patch,
      'users/$userId',
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
  Future<bool> deleteChildUser(String childUserId) async {
    return await client.request(
      HttpMethod.delete,
      'users/$childUserId',
      ApiVersion.v2,
    );
  }

  /// Retrieves the [Brand] of a [User].
  Future<Brand> retrieveBrand(String userId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'users/$userId/brand',
      ApiVersion.v2,
    );
    return Brand.fromJson(json);
  }

  /// Update the [Brand] of a [User].
  Future<Brand> updateBrand(String userId, UpdateBrand parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.patch,
      'users/$userId/brand',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Brand.fromJson(json);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/user.dart';
import 'package:easypost/src/common/models/pickup_rate.dart';
import 'package:easypost/src/common/models/rate.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/calculations/rates.dart';

class UserService extends Service {
  UserService(Client client) : super(client);

  Future<User> createChild(Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.post,
      'users',
      ApiVersion.v2,
      parameters: parameters.wrap(['user']),
    );
  }

  Future<User> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'users/$id',
      ApiVersion.v2,
    );
  }

  Future<User> retrieveMe() async {
    return await client.requestJson(
      HttpMethod.get,
      'users',
      ApiVersion.v2,
    );
  }

  Future<User> update(User user, Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.put,
      'users/${user.id}',
      ApiVersion.v2,
      parameters: parameters,
    );
  }

  Future<User> updateBrand(User user, Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.put,
      'users/${user.id}/brand',
      ApiVersion.v2,
      parameters: parameters.wrap(["brand"]),
    );
  }

  Future<bool> delete(User user) async {
    return await client.requestJson(
      HttpMethod.delete,
      'users/${user.id}',
      ApiVersion.v2,
    );
  }
}

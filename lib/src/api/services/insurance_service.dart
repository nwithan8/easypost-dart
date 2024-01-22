import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/insurance/list_insurance.dart';
import 'package:easypost/src/api/parameters/v2/insurance/create_insurance.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/insurance.dart';

/// The [InsuranceService] handles insurance with the EasyPost API.
class InsuranceService extends Service {
  InsuranceService(Client client) : super(client);

  /// Creates an [Insurance].
  Future<Insurance> create(CreateInsurance parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'insurances', ApiVersion.v2,
        parameters: parameterMap);
    return Insurance.fromJson(json);
  }

  /// Retrieves an [Insurance].
  Future<Insurance> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'insurances/$id', ApiVersion.v2);
    return Insurance.fromJson(json);
  }

  /// Lists all [Insurance]s.
  Future<InsuranceCollection> list({ListInsurance? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'insurances', ApiVersion.v2,
        parameters: parameterMap);
    return InsuranceCollection.fromJson(json);
  }
}

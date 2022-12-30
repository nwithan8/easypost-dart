import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/insurance.dart';
import 'package:easypost/src/parameters/insurance.dart';

class InsuranceService extends Service {
  InsuranceService(Client client) : super(client);

  Future<Insurance> create(InsuranceCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(
        HttpMethod.post, 'insurances', ApiVersion.v2,
        parameters: parameterMap);
    return Insurance.fromJson(json);
  }

  Future<Insurance> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'insurances/$id', ApiVersion.v2);
    return Insurance.fromJson(json);
  }

  Future<InsuranceCollection> list({InsuranceAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client);
    final json = await client.requestJson(
        HttpMethod.get, 'insurances', ApiVersion.v2,
        parameters: parameterMap);
    return InsuranceCollection.fromJson(json);
  }
}

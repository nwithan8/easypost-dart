import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/insurance.dart';

class InsuranceService extends Service {
  InsuranceService(Client client) : super(client);

  Future<Insurance> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'insurances', ApiVersion.v2,
        parameters: data.wrap(['insurance']));
    return Insurance.fromJson(json);
  }

  Future<Insurance> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'insurances/$id', ApiVersion.v2);
    return Insurance.fromJson(json);
  }

  Future<InsuranceCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'insurances', ApiVersion.v2,
        parameters: filters);
    return InsuranceCollection.fromJson(json);
  }
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/refund.dart';
import 'package:easypost/src/parameters/refunds.dart';

class RefundService extends Service {
  RefundService(Client client) : super(client);

  Future<Refund> create(RefundsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'refunds',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Refund> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'refunds/$id',
      ApiVersion.v2,
    );
  }

  Future<RefundCollection> list({RefundsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'refunds', ApiVersion.v2,
        parameters: parameterMap);
    return RefundCollection.fromJson(json);
  }
}

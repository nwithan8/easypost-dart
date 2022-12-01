import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/parameters.dart';
import 'package:easypost/src/models/refund.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/calculations/rates.dart';

class RefundService extends Service {
  RefundService(Client client) : super(client);

  Future<Refund> create(Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.post,
      'refunds',
      ApiVersion.v2,
      parameters: parameters.wrap(['refund']),
    );
  }

  Future<Refund> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'refunds/$id',
      ApiVersion.v2,
    );
  }

  Future<RefundCollection> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'refunds', ApiVersion.v2,
        parameters: filters);
    return RefundCollection.fromJson(json);
  }
}

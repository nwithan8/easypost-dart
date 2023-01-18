import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/models/refund.dart';
import 'package:easypost/src/api/parameters/refunds.dart';

/// The [RefundService] handles refunds with the EasyPost API.
class RefundService extends Service {
  RefundService(Client client) : super(client);

  /// Creates a [Refund].
  Future<Refund> create(RefundsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'refunds',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [Refund].
  Future<Refund> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'refunds/$id',
      ApiVersion.v2,
    );
  }

  /// Lists all [Refund]s.
  Future<RefundCollection> list({RefundsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'refunds', ApiVersion.v2,
        parameters: parameterMap);
    return RefundCollection.fromJson(json);
  }
}

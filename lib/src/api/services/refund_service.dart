import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/refunds/list_refunds.dart';
import 'package:easypost/src/api/parameters/v2/refunds/create_refund.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/refund.dart';

/// The [RefundService] handles refunds with the EasyPost API.
class RefundService extends Service {
  RefundService(Client client) : super(client);

  /// Creates a [Refund].
  Future<Refund> create(CreateRefund parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.post,
      'refunds',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Refund.fromJson(json);
  }

  /// Retrieves a [Refund].
  Future<Refund> retrieve(String id) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'refunds/$id',
      ApiVersion.v2,
    );
    return Refund.fromJson(json);
  }

  /// Lists all [Refund]s.
  Future<RefundCollection> list({ListRefunds? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'refunds', ApiVersion.v2,
        parameters: parameterMap);
    final collection = RefundCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [RefundCollection].
  Future<RefundCollection> getNextPage(RefundCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListRefunds? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.refunds, pageSize: pageSize)
    as Future<RefundCollection>;
  }
}

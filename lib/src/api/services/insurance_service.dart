import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/insurance/create_insurance.dart';
import 'package:easypost/src/api/parameters/v2/insurance/list_insurance.dart';
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
  Future<Insurance> retrieve(String insuranceId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'insurances/$insuranceId', ApiVersion.v2);
    return Insurance.fromJson(json);
  }

  /// Lists all [Insurance]s.
  Future<InsuranceCollection> list({ListInsurance? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'insurances', ApiVersion.v2,
        parameters: parameterMap);
    final collection = InsuranceCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [InsuranceCollection].
  Future<InsuranceCollection> getNextPage(InsuranceCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListInsurance? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
            retrieveNextPageFunction, collection.insurances, pageSize: pageSize)
        as Future<InsuranceCollection>;
  }
}

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/scan_forms/list_scan_forms.dart';
import 'package:easypost/src/api/parameters/v2/scan_forms/create_scan_form.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/scan_form.dart';

/// The [ScanFormService] handles scan forms with the EasyPost API.
class ScanFormService extends Service {
  ScanFormService(Client client) : super(client);

  /// Creates a [ScanForm].
  Future<ScanForm> create(CreateScanForm parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.post,
      'scan_forms',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return ScanForm.fromJson(json);
  }

  /// Retrieves a [ScanForm].
  Future<ScanForm> retrieve(String id) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'scan_forms/$id',
      ApiVersion.v2,
    );
    return ScanForm.fromJson(json);
  }

  /// Lists all [ScanForm]s.
  Future<ScanFormCollection> list({ListScanForms? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'scan_forms', ApiVersion.v2,
        parameters: parameterMap);
    final collection = ScanFormCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [ScanFormCollection].
  Future<ScanFormCollection> getNextPage(ScanFormCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListScanForms? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
        retrieveNextPageFunction, collection.scanForms, pageSize: pageSize)
    as Future<ScanFormCollection>;
  }
}

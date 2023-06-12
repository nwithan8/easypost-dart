import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/scan_forms/all_scan_forms.dart';
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
    return await client.requestJson(
      HttpMethod.post,
      'scan_forms',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [ScanForm].
  Future<ScanForm> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'scan_forms/$id',
      ApiVersion.v2,
    );
  }

  /// Lists all [ScanForm]s.
  Future<ScanFormCollection> list({AllScanForms? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'scan_forms', ApiVersion.v2,
        parameters: parameterMap);
    return ScanFormCollection.fromJson(json);
  }
}

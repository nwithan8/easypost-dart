import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/create_report.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/report.dart';

/// The [ReportService] handles reports with the EasyPost API.
class ReportService extends Service {
  ReportService(Client client) : super(client);

  /// Creates a [Report].
  Future<Report> create(String type, CreateReport parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json =  await client.requestJson(
      HttpMethod.post,
      'reports/$type',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Report.fromJson(json);
  }

  /// Retrieves a [Report].
  Future<Report> retrieve(String id) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'reports/$id',
      ApiVersion.v2,
    );
    return Report.fromJson(json);
  }

  /// Lists all [Report]s.
  Future<ReportCollection> list(String type, {AllReports? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'reports/$type', ApiVersion.v2,
        parameters: parameterMap);
    return ReportCollection.fromJson(json);
  }
}

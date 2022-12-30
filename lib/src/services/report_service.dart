import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/report.dart';
import 'package:easypost/src/parameters/reports.dart';

class ReportService extends Service {
  ReportService(Client client) : super(client);

  Future<Report> create(String type, ReportsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    return await client.requestJson(
      HttpMethod.post,
      'reports/$type',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Report> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'reports/$id',
      ApiVersion.v2,
    );
  }

  Future<ReportCollection> list(String type,
      {ReportsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client);
    final json = await client.requestJson(
        HttpMethod.get, 'reports/$type', ApiVersion.v2,
        parameters: parameterMap);
    return ReportCollection.fromJson(json);
  }
}

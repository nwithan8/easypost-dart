import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/models/report.dart';
import 'package:easypost/src/http/http_method.dart';

class ReportService extends Service {
  ReportService(Client client) : super(client);

  Future<Report> create(String type, Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.post,
      'reports/$type',
      ApiVersion.v2,
      parameters: parameters,
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
      {Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'reports/$type', ApiVersion.v2,
        parameters: filters);
    return ReportCollection.fromJson(json);
  }
}

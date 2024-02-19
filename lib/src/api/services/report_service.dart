import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/reports/create_report.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_reports.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/report.dart';

/// The [ReportService] handles reports with the EasyPost API.
class ReportService extends Service {
  ReportService(Client client) : super(client);

  /// Creates a [Report].
  Future<Report> create(CreateReport parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'reports/${parameters.reportType.toString()}',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Report.fromJson(json);
  }

  /// Retrieves a [Report].
  Future<Report> retrieve(String reportId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'reports/$reportId',
      ApiVersion.v2,
    );
    return Report.fromJson(json);
  }

  /// Lists all [Report]s.
  Future<ReportCollection> list(ListReports parameters) async {
    Map<String, dynamic>? parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(HttpMethod.get,
        'reports/${parameters.reportType.toString()}', ApiVersion.v2,
        parameters: parameterMap);
    final collection = ReportCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Retrieves the next page of an [RefundCollection].
  Future<ReportCollection> getNextPage(ReportCollection collection,
      {int? pageSize}) {
    if (collection.filters?.reportType == null) {
      throw ArgumentError('ReportType is required to retrieve the next page.');
    }
    retrieveNextPageFunction(ListReports? parameters) {
      if (parameters == null) {
        throw ArgumentError(
            'Parameters are required to retrieve the next page.');
      }
      return list(parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(retrieveNextPageFunction, collection.reports,
        pageSize: pageSize) as Future<ReportCollection>;
  }
}

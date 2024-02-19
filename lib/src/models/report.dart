import 'package:easypost/src/api/parameters/v2/reports/list_cash_flow_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_payment_log_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_refund_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_shipment_invoice_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_shipment_reports.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_tracker_reports.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/enums/report_type.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(explicitToJson: true)
class Report extends ReadOnlyModelWithId {
  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  @JsonKey(name: 'include_children')
  final bool? includeChildren;

  @JsonKey(name: 'start_date')
  final DateTime? startDate;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'url_expires_at')
  final DateTime? urlExpiresAt;

  ReportType? get type => ReportType.fromReport(this);

  Report(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.endDate,
    this.includeChildren,
    this.startDate,
    this.status,
    this.url,
    this.urlExpiresAt,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Report.fromJson(Map<String, dynamic> input) =>
      _$ReportFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportCollection extends PaginatedCollection<Report, ListReports> {
  @JsonKey(name: 'reports')
  final List<Report>? reports;

  @JsonKey(name: 'type')
  final String? type;

  ReportCollection(objectType, mode, hasMore, this.reports, this.type)
      : super(objectType, mode, hasMore);

  factory ReportCollection.fromJson(Map<String, dynamic> input) =>
      _$ReportCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ReportCollectionToJson(this);

  ListReports? _getDefaultListReportsParameters(ReportType? reportType) {
    if (reportType == ReportType.refund) {
      return ListRefundReports();
    } else if (reportType == ReportType.shipment) {
      return ListShipmentReports();
    } else if (reportType == ReportType.tracker) {
      return ListTrackerReports();
    } else if (reportType == ReportType.paymentLog) {
      return ListPaymentLogReports();
    } else if (reportType == ReportType.shipmentInvoice) {
      return ListShipmentInvoiceReports();
    } else if (reportType == ReportType.cashFlow) {
      return ListCashFlowReports();
    } else {
      return null;
    }
  }

  @override
  ListReports buildGetNextPageParameters(List<Report>? currentPageItems,
      {int? pageSize}) {
    ReportType? reportType = currentPageItems?.first.type;
    ListReports? parameters = _getDefaultListReportsParameters(reportType);
    if (filters != null) {
      parameters = filters;
    }
    if (parameters == null) {
      throw Exception(
          'Cannot retrieve next page of a ReportCollection without a report type');
    }

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

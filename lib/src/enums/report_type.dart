import 'package:easypost/src/internal/enums.dart';
import 'package:easypost/src/models/report.dart';

/// The available report types.
class ReportType extends SerializableEnum {
  /// The cash flow report type.
  static ReportType cashFlow = ReportType(1, 'cash_flow');

  /// The payment log report type.
  static ReportType paymentLog = ReportType(2, 'payment_log');

  /// The refund report type.
  static ReportType refund = ReportType(3, 'refund');

  /// The shipment report type.
  static ReportType shipment = ReportType(4, 'shipment');

  /// The shipment invoice report type.
  static ReportType shipmentInvoice = ReportType(5, 'shipment_invoice');

  /// The tracker report type.
  static ReportType tracker = ReportType(6, 'tracker');

  ReportType(super.id, super.jsonValue);

  /// Get the [ReportType] from a [String].
  static ReportType? fromString(String? value) {
    switch (value) {
      case 'cash_flow':
        return cashFlow;
      case 'payment_log':
        return paymentLog;
      case 'refund':
        return refund;
      case 'shipment':
        return shipment;
      case 'shipment_invoice':
        return shipmentInvoice;
      case 'tracker':
        return tracker;
      default:
        return null;
    }
  }

  /// Get the [ReportType] of a [Report].
  static ReportType? fromReport(Report report) {
    return fromId(report.prefix);
  }

  /// Get the [ReportType] of a [Report] by its ID prefix.
  static ReportType? fromId(String? prefix) {
    switch (prefix) {
      case 'cfrep':
        return ReportType.cashFlow;
      case 'plrep':
        return ReportType.paymentLog;
      case 'refrep':
        return ReportType.refund;
      case 'shprep':
        return ReportType.shipment;
      case 'shpinvrep':
        return ReportType.shipmentInvoice;
      case 'trkrep':
        return ReportType.tracker;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [ReportType].
  static String? asString(ReportType? reportType) => reportType.toString();
}

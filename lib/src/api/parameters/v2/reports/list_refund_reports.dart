import 'package:easypost/src/api/parameters/v2/reports/list_reports.dart';
import 'package:easypost/src/enums/report_type.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class ListRefundReports extends ListReports {
  ListRefundReports() : super(ReportType.refund);
}

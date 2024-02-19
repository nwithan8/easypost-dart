import 'package:easypost/easypost.dart';
import 'package:easypost/src/api/parameters/v2/reports/list_reports.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class ListTrackerReports extends ListReports {
  ListTrackerReports() : super(ReportType.tracker);
}

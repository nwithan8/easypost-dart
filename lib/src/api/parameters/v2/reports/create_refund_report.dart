import 'package:easypost/src/api/parameters/v2/reports/create_report.dart';
import 'package:easypost/src/enums/report_type.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateRefundReport extends CreateReport {
  CreateRefundReport() : super(ReportType.refund);
}

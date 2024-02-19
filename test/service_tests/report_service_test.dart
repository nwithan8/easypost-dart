import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'report_service_test.reflectable.dart';

void main() {
  group('Reports', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("reports", 'create');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;

      final report = await client.reports.create(reportParams);

      expect(report, isNotNull);
      expect(report, isA<Report>());
      expect(report.prefix, ModelPrefixes.shipmentReport);
    });

    test('create with columns', () async {
      Client client =
          TestUtils.setUpVCRClient("reports", 'create_with_columns');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;
      reportParams.columns = ['usps_zone'];

      final report = await client.reports.create(reportParams);

      // verify parameters by checking VCR cassette for correct URL
      // Some reports take a long time to generate, so we won't be able to consistently pull the report
      // There's unfortunately no way to check if the columns were included in the final report without parsing the CSV
      // so we assume, if we haven't gotten an error by this point, we've made the API calls correctly
      // any failure at this point is a server-side issue

      expect(report, isNotNull);
      expect(report, isA<Report>());
      expect(report.prefix, ModelPrefixes.shipmentReport);
    });

    test('create with additional columns', () async {
      Client client =
          TestUtils.setUpVCRClient("reports", 'create_with_additional_columns');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;
      reportParams.additionalColumns = ['from_name', 'from_company'];

      final report = await client.reports.create(reportParams);

      // verify parameters by checking VCR cassette for correct URL
      // Some reports take a long time to generate, so we won't be able to consistently pull the report
      // There's unfortunately no way to check if the columns were included in the final report without parsing the CSV
      // so we assume, if we haven't gotten an error by this point, we've made the API calls correctly
      // any failure at this point is a server-side issue

      expect(report, isNotNull);
      expect(report, isA<Report>());
      expect(report.prefix, ModelPrefixes.shipmentReport);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("reports", 'retrieve');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;

      final report = await client.reports.create(reportParams);
      final retrievedReport = await client.reports.retrieve(report.id);

      expect(retrievedReport, isNotNull);
      expect(retrievedReport, isA<Report>());
      expect(retrievedReport.id, startsWith(ModelPrefixes.shipmentReport));
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("reports", 'list');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;

      final report = await client.reports.create(reportParams);

      final listReportParams = ListShipmentReports();

      final reportCollection = await client.reports.list(listReportParams);

      expect(reportCollection, isNotNull);
      expect(reportCollection, isA<ReportCollection>());
      expect(reportCollection.reports!.length > 0, true);
      expect(reportCollection.reports![0].id,
          startsWith(ModelPrefixes.shipmentReport));
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("reports", 'get_next_page');
      client.enableTestMode();

      final reportParams = CreateShipmentReport();
      reportParams.startDate = Fixtures.reportDate;
      reportParams.endDate = Fixtures.reportDate;

      final report = await client.reports.create(reportParams);

      final listReportParams = ListShipmentReports();

      final reportCollection = await client.reports.list(listReportParams);

      try {
        // Test the next page if it exists
        final nextPage = await client.reports.getNextPage(reportCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<ReportCollection>());
        expect(nextPage.reports!.length > 0, true);
        expect(
            nextPage.reports![0].id, startsWith(ModelPrefixes.shipmentReport));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }
    });
  });
}

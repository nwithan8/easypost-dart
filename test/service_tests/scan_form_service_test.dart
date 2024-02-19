import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'scan_form_service_test.reflectable.dart';

void main() {
  group('Scan Forms', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("scan_forms", 'create');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = CreateScanForm();
      params.shipments = [shipment];

      final scanForm = await client.scanForms.create(params);

      expect(scanForm, isNotNull);
      expect(scanForm, isA<ScanForm>());
      expect(scanForm.id, startsWith(ModelPrefixes.scanForm));
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("scan_forms", 'retrieve');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = CreateScanForm();
      params.shipments = [shipment];

      final scanForm = await client.scanForms.create(params);

      final retrievedScanForm = await client.scanForms.retrieve(scanForm.id);

      expect(retrievedScanForm, isNotNull);
      expect(retrievedScanForm, isA<ScanForm>());
      expect(retrievedScanForm.id == scanForm.id, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("scan_forms", 'list');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = CreateScanForm();
      params.shipments = [shipment];

      final scanForm = await client.scanForms.create(params);

      final scanFormCollection = await client.scanForms.list();

      expect(scanFormCollection, isNotNull);
      expect(scanFormCollection, isA<ScanFormCollection>());
      expect(scanFormCollection.scanForms!.length > 0, true);
      expect(scanFormCollection.scanForms![0].id,
          startsWith(ModelPrefixes.scanForm));
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("scan_forms", 'get_next_page');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = CreateScanForm();
      params.shipments = [shipment];

      final scanForm = await client.scanForms.create(params);

      final scanFormCollection = await client.scanForms.list();

      try {
        // Test the next page if it exists
        final nextPage = await client.scanForms.getNextPage(scanFormCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<ScanFormCollection>());
        expect(nextPage.scanForms!.length > 0, true);
        expect(nextPage.scanForms![0].id, startsWith(ModelPrefixes.scanForm));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }
    });
  });
}

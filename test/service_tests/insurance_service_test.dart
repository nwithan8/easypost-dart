import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'insurance_service_test.reflectable.dart';

void main() {
  group('Insurance', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient('insurance', 'create');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = Fixtures.basicInsurance;
      params.trackingCode = shipment.trackingCode;

      final insurance = await client.insurance.create(params);

      expect(insurance, isNotNull);
      expect(insurance, isA<Insurance>());
      expect(insurance.id, startsWith("ins_"));
      expect(insurance.amount == params.amount, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("insurance", 'list');
      client.enableTestMode();

      final params = ListInsurance();
      params.pageSize = Fixtures.pageSize;

      final insuranceCollection =
          await client.insurance.list(parameters: params);

      expect(insuranceCollection, isNotNull);
      expect(insuranceCollection.insurances, isNotNull);
      expect(insuranceCollection.insurances!.length <= Fixtures.pageSize, true);
      for (Insurance insurance in insuranceCollection.insurances!) {
        expect(insurance, isA<Insurance>());
      }
    });

    test('next page', () async {
      Client client = TestUtils.setUpVCRClient("insurance", 'next_page');
      client.enableTestMode();

      final params = ListInsurance();
      params.pageSize = 1;

      final insuranceCollection =
          await client.insurance.list(parameters: params);

      expect(insuranceCollection, isNotNull);

      final nextPage =
          await client.insurance.getNextPage(insuranceCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });
  });
}

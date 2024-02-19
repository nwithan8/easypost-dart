import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'carrier_type_service_test.reflectable.dart';

void main() {
  group('Carrier Types', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("carrier_types", 'list');
      client.enableProductionMode();

      final List<CarrierType> carrierTypesList =
          await client.carrierTypes.list();

      expect(carrierTypesList, isNotNull);
      // page size is not a thing for carrier types list (list, not a collection)
      // expect(carrierTypesList.length <= Fixtures.pageSize, true);
      for (CarrierType type in carrierTypesList) {
        expect(type, isA<CarrierType>());
      }
    });
  });
}

import 'package:easypost/easypost.dart';
import 'package:test/test.dart';
import 'package:reflectable/reflectable.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'end_shipper_service_test.reflectable.dart';

void main() {
  group('EndShippers', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient('end_shippers', 'create');
      client.enableTestMode();

      final params = Fixtures.endShipper;

      final endShipper = await client.endShippers.create(params);

      expect(endShipper, isNotNull);
      expect(endShipper, isA<EndShipper>());
      expect(endShipper.id, startsWith(ModelPrefixes.endShipper));
      expect(endShipper.street1, "388 TOWNSEND ST APT 20");
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("end_shippers", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.endShipper;

      final endShipper = await client.endShippers.create(params);

      final retrievedEndShipper =
          await client.endShippers.retrieve(endShipper.id);

      expect(retrievedEndShipper, isNotNull);
      expect(retrievedEndShipper, isA<EndShipper>());
      expect(retrievedEndShipper.id == endShipper.id, true);
      expect(retrievedEndShipper.street1 == endShipper.street1, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("end_shippers", 'list');
      client.enableTestMode();

      final params = ListEndShippers();
      params.pageSize = Fixtures.pageSize;

      final endShipperCollection =
          await client.endShippers.list(parameters: params);

      expect(endShipperCollection, isNotNull);
      expect(endShipperCollection.endShippers, isNotNull);
      expect(
          endShipperCollection.endShippers!.length <= Fixtures.pageSize, true);
      for (EndShipper endShipper in endShipperCollection.endShippers!) {
        expect(endShipper, isA<EndShipper>());
      }
    });

    test('next page', () async {
      Client client = TestUtils.setUpVCRClient("end_shippers", 'next_page');
      client.enableTestMode();

      final params = ListEndShippers();
      params.pageSize = 1;

      final endShipperCollection =
          await client.endShippers.list(parameters: params);

      expect(endShipperCollection, isNotNull);

      final nextPage = await client.endShippers
          .getNextPage(endShipperCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });

    test('update', () async {
      Client client = TestUtils.setUpVCRClient("end_shippers", 'update');
      client.enableTestMode();

      final params = Fixtures.endShipper;

      final endShipper = await client.endShippers.create(params);

      final newName = "NEW NAME";

      // Updating an EndShipper requires all the original data to be sent back + the updated data
      final updatedParams = UpdateEndShipper(endShipper);
      updatedParams.name = newName;

      final updatedEndShipper =
          await client.endShippers.update(endShipper.id, updatedParams);

      expect(updatedEndShipper, isNotNull);
      expect(updatedEndShipper, isA<EndShipper>());
      expect(updatedEndShipper.id == endShipper.id, true);
      expect(updatedEndShipper.name == newName, true);
    });
  });
}

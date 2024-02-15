import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'pickup_service_test.reflectable.dart';

void main() {
  group('Pickups', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient('pickups', 'create');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = Fixtures.basicPickup;
      params.shipment = shipment;

      final pickup = await client.pickups.create(params);

      expect(pickup, isNotNull);
      expect(pickup, isA<Pickup>());
      expect(pickup.id, startsWith(ModelPrefixes.pickup));
      expect(pickup.rates, isNotNull);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("pickups", 'list');
      client.enableTestMode();

      final params = ListPickups();
      params.pageSize = Fixtures.pageSize;

      final pickupCollection =
          await client.pickups.list(parameters: params);

      expect(pickupCollection, isNotNull);
      expect(pickupCollection.pickups, isNotNull);
      expect(pickupCollection.pickups!.length <= Fixtures.pageSize, true);
      for (Pickup pickup in pickupCollection.pickups!) {
        expect(pickup, isA<Pickup>());
      }
    });

    test('next page', () async {
      Client client = TestUtils.setUpVCRClient("pickups", 'next_page');
      client.enableTestMode();

      final params = ListPickups();
      params.pageSize = 1;

      final pickupCollection =
          await client.pickups.list(parameters: params);

      expect(pickupCollection, isNotNull);

      final nextPage =
          await client.pickups.getNextPage(pickupCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("pickups", 'retrieve');
      client.enableTestMode();

      final shipment =
      await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = Fixtures.basicPickup;
      params.shipment = shipment;

      final pickup = await client.pickups.create(params);

      final retrievedPickup = await client.pickups.retrieve(pickup.id);

      expect(retrievedPickup, isNotNull);
      expect(retrievedPickup, isA<Pickup>());
      expect(retrievedPickup.id == pickup.id, true);
    });

    test('buy with carrier and service', () async {
      Client client = TestUtils.setUpVCRClient("pickups", 'buy_with_carrier_and_service');
      client.enableTestMode();

      final shipment =
      await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = Fixtures.basicPickup;
      params.shipment = shipment;

      final pickup = await client.pickups.create(params);

      final lowestRate = client.pickups.getLowestRateFor(pickup);
      final buyParams = BuyPickup();
      buyParams.carrier = lowestRate!.carrier;
      buyParams.service = lowestRate.service;

      final boughtPickup = await client.pickups.buy(pickup.id, buyParams);

      expect(boughtPickup, isNotNull);
      expect(boughtPickup, isA<Pickup>());
      expect(boughtPickup.id == pickup.id, true);
      expect(boughtPickup.status, 'scheduled');
    });

    test('buy with rate', () async {
      Client client = TestUtils.setUpVCRClient("pickups", 'buy_with_rate');
      client.enableTestMode();

      final shipment =
      await client.shipments.create(Fixtures.oneCallBuyShipment);

      final params = Fixtures.basicPickup;
      params.shipment = shipment;

      final pickup = await client.pickups.create(params);

      final lowestRate = client.pickups.getLowestRateFor(pickup);

      final buyParams = BuyPickup.fromPickupRate(lowestRate!);

      final boughtPickup = await client.pickups.buy(pickup.id, buyParams);

      expect(boughtPickup, isNotNull);
      expect(boughtPickup, isA<Pickup>());
      expect(boughtPickup.id == pickup.id, true);
      expect(boughtPickup.status, 'scheduled');
    });
  });
}

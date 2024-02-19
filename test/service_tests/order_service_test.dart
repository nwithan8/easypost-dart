import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'order_service_test.reflectable.dart';

void main() {
  group('Orders', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("orders", 'create');
      client.enableTestMode();

      final params = Fixtures.basicOrder;

      final order = await client.orders.create(params);

      expect(order, isNotNull);
      expect(order, isA<Order>());
      expect(order.id, startsWith(ModelPrefixes.order));
      expect(order.rates, isNotNull);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("orders", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.basicOrder;

      final order = await client.orders.create(params);

      final retrievedOrder = await client.orders.retrieve(order.id);

      expect(retrievedOrder, isNotNull);
      expect(retrievedOrder, isA<Order>());
      expect(retrievedOrder.id == order.id, true);
    });

    test('buy with carrier and service', () async {
      Client client =
          TestUtils.setUpVCRClient("orders", 'buy_with_carrier_and_service');
      client.enableTestMode();

      final params = Fixtures.basicOrder;

      final order = await client.orders.create(params);

      final lowestRate = client.orders.getLowestRateFor(order);
      final buyParams = BuyOrder();
      buyParams.carrier = lowestRate!.carrier;
      buyParams.service = lowestRate.service;

      final boughtOrder = await client.orders.buy(order.id, buyParams);

      final shipments = boughtOrder.shipments!;
      for (Shipment shipment in shipments) {
        expect(shipment.postageLabel, isNotNull);
      }
    });

    test('buy with rate', () async {
      Client client = TestUtils.setUpVCRClient("orders", 'buy_with_rate');
      client.enableTestMode();

      final params = Fixtures.basicOrder;

      final order = await client.orders.create(params);

      final lowestRate = client.orders.getLowestRateFor(order);

      final buyParams = BuyOrder.fromOrderRate(lowestRate!);

      final boughtOrder = await client.orders.buy(order.id, buyParams);

      final shipments = boughtOrder.shipments!;
      for (Shipment shipment in shipments) {
        expect(shipment.postageLabel, isNotNull);
      }
    });
  });
}

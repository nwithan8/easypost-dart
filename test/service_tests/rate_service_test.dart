import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'rate_service_test.reflectable.dart';

void main() {
  group('Rates', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('get rate quotes for proposed shipment', () async {
      Client client = TestUtils.setUpVCRClient("rates", 'get_quoted_rates');
      client.enableTestMode();

      final params = Fixtures.retrieveQuotedRatesParameters;

      final rates = await client.rates.retrieveRateQuotes(params);

      expect(rates, isNotNull);
      for (var rate in rates!) {
        expect(rate, isA<QuotedRate>());
        expect(rate.service, isNotNull);
        expect(rate.carrier, isNotNull);
        expect(rate.price, isNotNull);
      }
    });

    test('get lowest rate', () async {
      Client client = TestUtils.setUpVCRClient("rates", 'get_lowest_rate');
      client.enableTestMode();

      final price1 = 100.00;
      final carrier1 = "carrier1";
      final service1 = "service1";
      final price2 = 200.00;
      final carrier2 = "carrier2";
      final service2 = "service2";
      final rates = [
        QuotedRate("quoted_rate", "test", null, carrier1, null, null, null,
            null, null, null, null, null, price1, null, null, service1),
        QuotedRate("quoted_rate", "test", null, carrier2, null, null, null,
            null, null, null, null, null, price2, null, null, service2),
      ];
      final lowestRate = client.rates.getLowestRate(rates!);

      expect(lowestRate, isNotNull);
      expect(lowestRate, isA<QuotedRate>());
      expect(lowestRate.service == service1, isTrue);
      expect(lowestRate.carrier == carrier1, isTrue);
      expect(lowestRate.price == price1, isTrue);
    });

    test('get lowest rate with filters', () async {
      Client client =
          TestUtils.setUpVCRClient("rates", 'get_lowest_rate_with_filters');
      client.enableTestMode();

      final price1 = 100.00;
      final carrier1 = "carrier1";
      final service1 = "service1";
      final price2 = 200.00;
      final carrier2 = "carrier2";
      final service2 = "service2";
      final rates = [
        QuotedRate("quoted_rate", "test", null, carrier1, null, null, null,
            null, null, null, null, null, price1, null, null, service1),
        QuotedRate("quoted_rate", "test", null, carrier2, null, null, null,
            null, null, null, null, null, price2, null, null, service2),
      ];
      final lowestRate =
          client.rates.getLowestRate(rates!, includeCarriers: [carrier2]);

      expect(lowestRate, isNotNull);
      expect(lowestRate, isA<QuotedRate>());
      expect(lowestRate.service == service2, isTrue);
      expect(lowestRate.carrier == carrier2, isTrue);
      expect(lowestRate.price == price2, isTrue);

      final lowestRate2 =
          client.rates.getLowestRate(rates!, excludeCarriers: [carrier1]);

      expect(lowestRate2, isNotNull);
      expect(lowestRate2, isA<QuotedRate>());
      expect(lowestRate2.service == service2, isTrue);
      expect(lowestRate2.carrier == carrier2, isTrue);
      expect(lowestRate2.price == price2, isTrue);

      final lowestRate3 =
          client.rates.getLowestRate(rates!, includeServices: [service2]);

      expect(lowestRate3, isNotNull);
      expect(lowestRate3, isA<QuotedRate>());
      expect(lowestRate3.service == service2, isTrue);
      expect(lowestRate3.carrier == carrier2, isTrue);
      expect(lowestRate3.price == price2, isTrue);

      final lowestRate4 =
          client.rates.getLowestRate(rates!, excludeServices: [service1]);

      expect(lowestRate4, isNotNull);
      expect(lowestRate4, isA<QuotedRate>());
      expect(lowestRate4.service == service2, isTrue);
      expect(lowestRate4.carrier == carrier2, isTrue);
      expect(lowestRate4.price == price2, isTrue);

      final lowestRate5 = client.rates.getLowestRate(rates!,
          includeCarriers: [carrier2], includeServices: [service2]);

      expect(lowestRate5, isNotNull);
      expect(lowestRate5, isA<QuotedRate>());
      expect(lowestRate5.service == service2, isTrue);
      expect(lowestRate5.carrier == carrier2, isTrue);
      expect(lowestRate5.price == price2, isTrue);

      // expect exception
      expect(() => client.rates.getLowestRate(rates!,
          includeCarriers: [carrier1], excludeServices: [service1]),
          throwsA(isA<FilteringException>()));

      expect(() => client.rates.getLowestRate(rates!,
          includeCarriers: [carrier1], includeServices: [service2]),
          throwsA(isA<FilteringException>()));

      expect(() => client.rates.getLowestRate(rates!,
          excludeCarriers: [carrier1], excludeServices: [service2]),
          throwsA(isA<FilteringException>()));

      expect(() => client.rates.getLowestRate(rates!,
          excludeCarriers: [carrier1], includeServices: [service1]),
          throwsA(isA<FilteringException>()));
    });

    test('convert quoted rate to shipment rate', () async {
      Client client = TestUtils.setUpVCRClient(
          "rates", 'convert_quoted_rate_to_shipment_rate');
      client.enableTestMode();

      final params = Fixtures.retrieveQuotedRatesParameters;

      final quotedRates = await client.rates.retrieveRateQuotes(params);
      final lowestQuotedRate = await client.rates.getLowestRate(quotedRates!);

      final shipmentRates = [
        ShipmentRate(
          "shipment_rate",
          "test",
          null,
          lowestQuotedRate.carrier,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          lowestQuotedRate.price,
          null,
          null,
          lowestQuotedRate.service,
          "id_123",
          "shipment_id_123",
        )
      ];

      final shipment = Shipment(
        "123",
        DateTime.now(),
        DateTime.now(),
        "shipment",
        "test",
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        shipmentRates,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
      );

      final shipmentRate = shipment.associatedShipmentRate(lowestQuotedRate);

      expect(shipmentRate, isNotNull);
      expect(shipmentRate!.price == lowestQuotedRate.price, isTrue);
      expect(shipmentRate.service == lowestQuotedRate.service, isTrue);
      expect(shipmentRate.carrier == lowestQuotedRate.carrier, isTrue);
    });

    test('convert quoted rate to order rate', () async {
      Client client = TestUtils.setUpVCRClient(
          "rates", 'convert_quoted_rate_to_order_rate');
      client.enableTestMode();

      final params = Fixtures.retrieveQuotedRatesParameters;

      final quotedRates = await client.rates.retrieveRateQuotes(params);
      final lowestQuotedRate = await client.rates.getLowestRate(quotedRates!);

      final orderRates = [
        OrderRate(
          "order_rate",
          "test",
          null,
          lowestQuotedRate.carrier,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          lowestQuotedRate.price,
          null,
          null,
          lowestQuotedRate.service,
          "id_123",
          "order_id_123",
        )
      ];

      final order = Order(
          "123",
          DateTime.now(),
          DateTime.now(),
          "order",
          "test",
          null,
          null,
          null,
          null,
          null,
          null,
          orderRates,
          null,
          null,
          null,
          null,
          null);

      final orderRate = order.associatedOrderRate(lowestQuotedRate);

      expect(orderRate, isNotNull);
      expect(orderRate!.price == lowestQuotedRate.price, isTrue);
      expect(orderRate.service == lowestQuotedRate.service, isTrue);
      expect(orderRate.carrier == lowestQuotedRate.carrier, isTrue);
    });

    test('convert quoted rate to pickup rate', () async {
      Client client = TestUtils.setUpVCRClient(
          "rates", 'convert_quoted_rate_to_pickup_rate');
      client.enableTestMode();

      final params = Fixtures.retrieveQuotedRatesParameters;

      final quotedRates = await client.rates.retrieveRateQuotes(params);
      final lowestQuotedRate = await client.rates.getLowestRate(quotedRates!);

      final pickupRates = [
        PickupRate(
          "pickup_rate",
          "test",
          null,
          lowestQuotedRate.carrier,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          null,
          lowestQuotedRate.price,
          null,
          null,
          lowestQuotedRate.service,
          "id_123",
          "pickup_id_123",
        )
      ];

      final pickup = Pickup(
        "123",
        DateTime.now(),
        DateTime.now(),
        "pickup",
        "test",
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        pickupRates,
        null,
        null,
      );

      final pickupRate = pickup.associatedPickupRate(lowestQuotedRate);

      expect(pickupRate, isNotNull);
      expect(pickupRate!.price == lowestQuotedRate.price, isTrue);
      expect(pickupRate.service == lowestQuotedRate.service, isTrue);
      expect(pickupRate.carrier == lowestQuotedRate.carrier, isTrue);
    });
  });
}

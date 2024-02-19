import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'refund_service_test.reflectable.dart';

void main() {
  group('Refunds', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("refunds", 'create');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);
      final updatedShipment = await client.shipments.retrieve(shipment.id);

      final refundParams = CreateRefund();
      refundParams.carrier = updatedShipment.selectedRate!.carrier;
      refundParams.trackingCode = updatedShipment.trackingCode;

      final refunds = await client.refunds.create(refundParams);

      expect(refunds, isNotNull);
      expect(refunds, isA<List<Refund>>());
      expect(refunds.length > 0, true);
      expect(refunds[0].id, startsWith(ModelPrefixes.refund));
      expect(refunds[0].status, "submitted");
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("refunds", 'retrieve');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);
      final updatedShipment = await client.shipments.retrieve(shipment.id);

      final refundParams = CreateRefund();
      refundParams.carrier = updatedShipment.selectedRate!.carrier;
      refundParams.trackingCode = updatedShipment.trackingCode;

      final refunds = await client.refunds.create(refundParams);
      final retrievedRefund = await client.refunds.retrieve(refunds[0].id);

      expect(retrievedRefund, isNotNull);
      expect(retrievedRefund, isA<Refund>());
      expect(retrievedRefund.id == refunds[0].id, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("refunds", 'list');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);
      final updatedShipment = await client.shipments.retrieve(shipment.id);

      final refundParams = CreateRefund();
      refundParams.carrier = updatedShipment.selectedRate!.carrier;
      refundParams.trackingCode = updatedShipment.trackingCode;

      final refunds = await client.refunds.create(refundParams);
      final refundCollection = await client.refunds.list();

      expect(refundCollection, isNotNull);
      expect(refundCollection, isA<RefundCollection>());
      expect(refundCollection.refunds!.length > 0, true);
      expect(refundCollection.refunds![0].id, startsWith(ModelPrefixes.refund));
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("refunds", 'get_next_page');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);
      final updatedShipment = await client.shipments.retrieve(shipment.id);

      final refundParams = CreateRefund();
      refundParams.carrier = updatedShipment.selectedRate!.carrier;
      refundParams.trackingCode = updatedShipment.trackingCode;

      final refunds = await client.refunds.create(refundParams);
      final refundCollection = await client.refunds.list();

      try {
        // Test the next page if it exists
        final nextPage = await client.refunds.getNextPage(refundCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<RefundCollection>());
        expect(nextPage.refunds!.length > 0, true);
        expect(nextPage.refunds![0].id, startsWith(ModelPrefixes.refund));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }
    });
  });
}

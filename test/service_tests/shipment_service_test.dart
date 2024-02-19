import 'package:easypost/easypost.dart';
import 'package:easypost/src/constants.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'shipment_service_test.reflectable.dart';

void main() {
  group('Shipments', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'create');
      client.enableTestMode();

      final params = Fixtures.basicShipment;

      final shipment = await client.shipments.create(params);

      expect(shipment, isNotNull);
      expect(shipment, isA<Shipment>());
      expect(shipment.id, startsWith(ModelPrefixes.shipment));
      expect(shipment.rates, isA<List<ShipmentRate>>());
    });

    test('create with existing objects', () async {
      Client client =
          TestUtils.setUpVCRClient("shipments", 'create_with_existing_objects');
      client.enableTestMode();

      final toAddress = await client.addresses.create(Fixtures.caAddress1);
      final fromAddress = await client.addresses.create(Fixtures.caAddress2);
      final parcel = await client.parcels.create(Fixtures.basicParcel);

      final params = CreateShipment();
      params.toAddress = toAddress;
      params.fromAddress = fromAddress;
      params.parcel = parcel;

      final shipment = await client.shipments.create(params);

      expect(shipment, isNotNull);
      expect(shipment, isA<Shipment>());
      expect(shipment.id, startsWith(ModelPrefixes.shipment));
      expect(shipment.toAddress?.id == toAddress.id, true);
      expect(shipment.fromAddress?.id == fromAddress.id, true);
      expect(shipment.parcel?.id == parcel.id, true);
    });

    test('create with new data', () async {
      Client client =
          TestUtils.setUpVCRClient("shipments", 'create_with_new_data');
      client.enableTestMode();

      final params = CreateShipment();
      params.toAddress = Fixtures.caAddress1;
      params.fromAddress = Fixtures.caAddress2;
      params.parcel = Fixtures.basicParcel;

      final shipment = await client.shipments.create(params);

      expect(shipment, isNotNull);
      expect(shipment, isA<Shipment>());
      expect(shipment.id, startsWith(ModelPrefixes.shipment));
      expect(shipment.toAddress?.id, startsWith(ModelPrefixes.address));
      expect(shipment.fromAddress?.id, startsWith(ModelPrefixes.address));
      expect(shipment.parcel?.id, startsWith(ModelPrefixes.parcel));
    });

    test('create with tax identifiers', () async {
      Client client =
          TestUtils.setUpVCRClient("shipments", 'create_with_tax_identifiers');
      client.enableTestMode();

      final taxIdentifier = Fixtures.taxIdentifier;

      final params = Fixtures.basicShipment;
      params.taxIdentifiers = [taxIdentifier];

      final shipment = await client.shipments.create(params);

      expect(shipment, isNotNull);
      expect(shipment, isA<Shipment>());
      expect(shipment.id, startsWith(ModelPrefixes.shipment));
      expect(shipment.taxIdentifiers, isA<List<TaxIdentifier>>());
      expect(shipment.taxIdentifiers!.first.taxIdType, taxIdentifier.taxIdType);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'retrieve');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.basicShipment);
      final retrievedShipment = await client.shipments.retrieve(shipment.id);

      expect(retrievedShipment, isNotNull);
      expect(retrievedShipment, isA<Shipment>());
      expect(retrievedShipment.id, startsWith(ModelPrefixes.shipment));
      expect(retrievedShipment.id == shipment.id, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'list');
      client.enableTestMode();

      final shipmentCollection = await client.shipments.list();

      expect(shipmentCollection, isNotNull);
      expect(shipmentCollection, isA<ShipmentCollection>());
      expect(shipmentCollection.shipments, isA<List<Shipment>>());
      expect(shipmentCollection.shipments!.first.id,
          startsWith(ModelPrefixes.shipment));
    });

    test('get next page', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'get_next_page');
      client.enableTestMode();

      final shipmentCollection = await client.shipments.list();

      try {
        // Test the next page if it exists
        final nextPage = await client.shipments.getNextPage(shipmentCollection);
        expect(nextPage, isNotNull);
        expect(nextPage, isA<ShipmentCollection>());
        expect(nextPage.shipments!.length > 0, true);
        expect(
            nextPage.shipments!.first.id, startsWith(ModelPrefixes.shipment));
      } on PaginationException catch (e) {
        // If there is no next page, the exception will be caught here
        expect(e, isA<PaginationException>());
        expect(e.message, ErrorMessages.noMorePagesToRetrieve);
      }
    });

    test('get next page filter passthrough', () async {
      Client client = TestUtils.setUpVCRClient(
          "shipments", 'get_next_page_filter_passthrough');
      client.enableTestMode();

      bool includeChildren = true;
      bool purchased = false;

      final params = ListShipments();
      params.includeShipmentsFromChildren = includeChildren;
      params.purchased = purchased;

      final shipmentCollection =
          await client.shipments.list(parameters: params);

      expect(shipmentCollection, isNotNull);
      expect(shipmentCollection, isA<ShipmentCollection>());
      expect(shipmentCollection.filters, isNotNull);
      expect(shipmentCollection.filters!.includeShipmentsFromChildren,
          includeChildren);
      expect(shipmentCollection.filters!.purchased, purchased);
    });

    test('get smart rates', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'get_smart_rates');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.basicShipment);

      expect(shipment.rates, isNotNull);

      final smartRates = await client.shipments.getSmartRates(shipment.id);
      expect(smartRates, isA<List<SmartRate>>());
      expect(smartRates.length > 0, true);

      final smartRate = smartRates.first;

      // Must compare IDs because one is a ShipmentRate and the other is a SmartRate
      expect(smartRate.id == shipment.rates!.first.id, true);

      expect(smartRate.timeInTransit, isNotNull);
      expect(smartRate.timeInTransit!.percentile50, isNotNull);
      expect(smartRate.timeInTransit!.percentile75, isNotNull);
      expect(smartRate.timeInTransit!.percentile85, isNotNull);
      expect(smartRate.timeInTransit!.percentile90, isNotNull);
      expect(smartRate.timeInTransit!.percentile95, isNotNull);
      expect(smartRate.timeInTransit!.percentile97, isNotNull);
      expect(smartRate.timeInTransit!.percentile99, isNotNull);
    });

    test('buy shipment', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'buy_shipment');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.fullShipment);
      final rate = client.shipments.getLowestRateFor(shipment);

      final purchaseParams = BuyShipment();
      purchaseParams.rate = rate;
      final purchasedShipment =
          await client.shipments.buy(shipment.id, purchaseParams);

      expect(purchasedShipment, isNotNull);
      expect(purchasedShipment, isA<Shipment>());
      expect(purchasedShipment.id, startsWith(ModelPrefixes.shipment));
      expect(purchasedShipment.postageLabel, isNotNull);
    });

    test('buy with endshipper', () async {
      Client client =
          TestUtils.setUpVCRClient("shipments", 'buy_with_endshipper');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.fullShipment);
      final rate = client.shipments.getLowestRateFor(shipment);

      final endShipper = await client.endShippers.create(Fixtures.endShipper);

      final purchaseParams = BuyShipment();
      purchaseParams.rate = rate;
      purchaseParams.endShipper = endShipper;

      final purchasedShipment =
          await client.shipments.buy(shipment.id, purchaseParams);

      expect(purchasedShipment, isNotNull);
      expect(purchasedShipment, isA<Shipment>());
      expect(purchasedShipment.id, startsWith(ModelPrefixes.shipment));
      expect(purchasedShipment.postageLabel, isNotNull);
    });

    test('generate label', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'generate_label');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final labelParams = CreateShipmentLabel();
      labelParams.fileFormat = FileFormat.zpl;

      final shipmentWithLabel =
          await client.shipments.generateLabel(shipment.id, labelParams);

      expect(shipmentWithLabel, isNotNull);
      expect(shipmentWithLabel, isA<Shipment>());
      expect(shipmentWithLabel.id, startsWith(ModelPrefixes.shipment));
      expect(shipmentWithLabel.id == shipment.id, true);
      expect(shipmentWithLabel.postageLabel, isNotNull);
      expect(shipmentWithLabel.postageLabel!.labelPdfUrl, isNull);
      expect(shipmentWithLabel.postageLabel!.labelZplUrl, isNotNull);
    });

    test('generate form', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'generate_form');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final formParams = CreateShipmentForm();
      formParams.formType = FormType.labelQrCode;

      final shipmentWithForm =
          await client.shipments.generateForm(shipment.id, formParams);

      expect(shipmentWithForm, isNotNull);
      expect(shipmentWithForm, isA<Shipment>());
      expect(shipmentWithForm.id, startsWith(ModelPrefixes.shipment));
      expect(shipmentWithForm.id == shipment.id, true);
      expect(shipmentWithForm.forms, isA<List<Form>>());
      expect(shipmentWithForm.forms!.first.formType, formParams.formType);
      expect(shipmentWithForm.forms!.first.formUrl, isNotNull);
    });

    test('insure shipment', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'insure_shipment');
      client.enableTestMode();

      final params = Fixtures.oneCallBuyShipment;
      // Set to 0 so USPS doesn't insure this automatically and we can insure the shipment manually
      params.insurance = 0.00;

      final shipment = await client.shipments.create(params);

      final insureParams = InsureShipment();
      insureParams.amount = 100.00;

      final insuredShipment =
          await client.shipments.insure(shipment.id, insureParams);

      expect(insuredShipment, isNotNull);
      expect(insuredShipment, isA<Shipment>());
      expect(insuredShipment.id, startsWith(ModelPrefixes.shipment));
      expect(insuredShipment.insurance, insureParams.amount);
    });

    test('refund shipment', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'refund_shipment');
      client.enableTestMode();

      final shipment =
          await client.shipments.create(Fixtures.oneCallBuyShipment);

      final refundedShipment = await client.shipments.refund(shipment.id);

      expect(refundedShipment, isNotNull);
      expect(refundedShipment, isA<Shipment>());
      expect(refundedShipment.id, startsWith(ModelPrefixes.shipment));
      expect(refundedShipment.refundStatus, "submitted");
    });

    test('refresh rates', () async {
      Client client = TestUtils.setUpVCRClient("shipments", 'refresh_rates');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.fullShipment);

      final rates = await client.shipments.refreshRates(shipment.id);

      expect(rates, isNotNull);
      expect(rates, isA<List<ShipmentRate>>());
    });
  });

  test('get estimated delivery dates', () async {
    Client client =
        TestUtils.setUpVCRClient("shipments", 'get_estimated_delivery_dates');
    client.enableTestMode();

    final shipment = await client.shipments.create(Fixtures.basicShipment);

    final rates = await client.shipments
        .getEstimatedDeliveryDates(shipment.id, Fixtures.plannedShipDate);

    expect(rates, isA<List<RateWithEstimatedDeliveryDate>>());
    expect(rates.length > 0, true);

    for (var rate in rates) {
      expect(rate.smartRate, isA<SmartRate>());
      expect(rate.smartRate, isNotNull);
      expect(rate.details, isA<TimeInTransitDetails>());
      expect(rate.details, isNotNull);
      expect(rate.details!.daysInTransit, isNotNull);
      expect(rate.details!.estimatedDeliveryDate, isNotNull);
      expect(rate.details!.plannedShipDate, isNotNull);
    }
  });
}

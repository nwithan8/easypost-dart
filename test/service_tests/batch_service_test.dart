import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'batch_service_test.reflectable.dart';

void main() {
  group('Batches', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'create');
      client.enableTestMode();

      final params = CreateBatch();
      params.shipments = [Fixtures.basicShipment];

      final batch = await client.batches.create(params);

      expect(batch, isNotNull);
      expect(batch, isA<Batch>());
      expect(batch.id, startsWith("batch_"));
      expect(batch.shipments, isNotNull);
    });

    test('create with existing shipments', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'create_with_existing_shipments');
      client.enableTestMode();

      final shipment = await client.shipments.create(Fixtures.basicShipment);

      final params = CreateBatch();
      params.shipments = [shipment];

      final batch = await client.batches.create(params);

      expect(batch, isNotNull);
      expect(batch, isA<Batch>());
      expect(batch.id, startsWith("batch_"));
      expect(batch.shipments, isNotNull);
    });


    test('list', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'list');
      client.enableTestMode();

      final params = ListBatches();
      params.pageSize = Fixtures.pageSize;

      final batchCollection = await client.batches.list(parameters: params);

      expect(batchCollection, isNotNull);
      expect(batchCollection.batches, isNotNull);
      expect(batchCollection.batches!.length <= Fixtures.pageSize, true);
      for (Batch batch in batchCollection.batches!) {
        expect(batch, isA<Batch>());
      }
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'retrieve');
      client.enableTestMode();

      final params = CreateBatch();
      params.shipments = [Fixtures.basicShipment];

      final batch = await client.batches.create(params);

      final retrievedBatch = await client.batches.retrieve(batch.id);

      expect(retrievedBatch, isNotNull);
      expect(retrievedBatch, isA<Batch>());
      expect(retrievedBatch.id == batch.id, true);
    });

    test('add shipments', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'add_shipments');
      client.enableTestMode();

      final batchCreateParams = CreateBatch();
      final batch = await client.batches.create(batchCreateParams);

      final shipment = await client.shipments.create(Fixtures.oneCallBuyShipment);

      final batchUpdateShipmentsParams = UpdateBatchShipments();
      batchUpdateShipmentsParams.shipments = [shipment];

      final updatedBatch =
          await client.batches.addShipments(batch.id, batchUpdateShipmentsParams);

      expect(updatedBatch, isNotNull);
      expect(updatedBatch, isA<Batch>());
      expect(updatedBatch.shipments, isNotNull);
      expect(updatedBatch.shipments!.length, 1);
    });

    test('remove shipments', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'remove_shipments');
      client.enableTestMode();

      final batchCreateParams = CreateBatch();
      final batch = await client.batches.create(batchCreateParams);

      final shipment = await client.shipments.create(Fixtures.oneCallBuyShipment);

      final batchUpdateShipmentsParams = UpdateBatchShipments();
      batchUpdateShipmentsParams.shipments = [shipment];

      final updatedBatch =
          await client.batches.addShipments(batch.id, batchUpdateShipmentsParams);

      expect(updatedBatch, isNotNull);
      expect(updatedBatch, isA<Batch>());
      expect(updatedBatch.shipments, isNotNull);
      expect(updatedBatch.shipments!.length, 1);

      final batchRemoveShipmentsParams = UpdateBatchShipments();
      batchRemoveShipmentsParams.shipments = [shipment];

      final removedBatch =
          await client.batches.removeShipments(updatedBatch.id, batchRemoveShipmentsParams);

      expect(removedBatch, isNotNull);
      expect(removedBatch, isA<Batch>());
      expect(removedBatch.shipments, isNotNull);
      expect(removedBatch.shipments!.length, 0);
    });

    test('generate label', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'generate_label');
      client.enableTestMode();

      CreateBatch createBatchParams = CreateBatch();
      createBatchParams.shipments = [Fixtures.oneCallBuyShipment];

      Batch batch = await client.batches.create(createBatchParams);

      if (client.config.boolFunctionResult) {
        await Future.delayed(Duration(seconds: 10));
      }

      final purchasedBatch = await client.batches.purchase(batch.id);

      if (client.config.boolFunctionResult) {
        await Future.delayed(Duration(seconds: 10));
      }

      final labelParams = CreateBatchDocument();
      labelParams.fileFormat = FileFormat.pdf;

      final labeledBatch =
          await client.batches.generateLabel(purchasedBatch.id, labelParams);

      expect(labeledBatch, isNotNull);
      expect(labeledBatch.state, BatchState.labelGenerating);
    });

    test('generate scan form', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'generate_scan_form');
      client.enableTestMode();

      final createParams = CreateBatch();
      createParams.shipments = [Fixtures.oneCallBuyShipment];

      final batch = await client.batches.create(createParams);

      if (client.config.boolFunctionResult) {
        await Future.delayed(Duration(seconds: 10));
      }

      final purchasedBatch = await client.batches.purchase(batch.id);

      if (client.config.boolFunctionResult) {
        await Future.delayed(Duration(seconds: 10));
      }

      final scanFormParams = CreateBatchDocument();
      scanFormParams.fileFormat = FileFormat.zpl;

      final scannedBatch =
          await client.batches.generateScanForm(purchasedBatch.id, scanFormParams);

      expect(scannedBatch, isNotNull);
      expect(scannedBatch.scanForm, isNotNull);
    });
  });
}

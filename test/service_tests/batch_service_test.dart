import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';

void main() {
  group('Batches', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'create');
      client.enableTestMode();

      final params = BatchesCreate();
      params.shipmentCreationParameters = [Fixtures.basicShipment];

      final batch = await client.batches.create(params);

      expect(batch, isNotNull);
      expect(batch, isA<Batch>());
      expect(batch.id, startsWith("batch_"));
    });

    test('all', () async {
      Client client =
          TestUtils.setUpVCRClient("batches", 'all');
      client.enableTestMode();

      final params = BatchesAll();
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

      final params = BatchesCreate();
      params.shipmentCreationParameters = [Fixtures.basicShipment];

      final batch = await client.batches.create(params);

      final retrievedBatch = await client.batches.retrieve(batch.id!);

      expect(retrievedBatch, isNotNull);
      expect(retrievedBatch, isA<Batch>());
      expect(retrievedBatch.id == batch.id, true);
    });

    test('generate label', () async {
      Client client = TestUtils.setUpVCRClient("batches", 'generate_label');
      client.enableTestMode();

      final createParams = BatchesCreate();
      createParams.shipmentCreationParameters = [Fixtures.basicShipment];

      final batch = await client.batches.create(createParams);

      final labelParams = BatchesCreateDocument();
      labelParams.fileFormat = FileFormat.pdf;

      final labeledBatch =
          await client.batches.generateLabel(batch, labelParams);

      expect(labeledBatch, isNotNull);
      expect(labeledBatch.labelUrl, isNotNull);
    });
  });
}

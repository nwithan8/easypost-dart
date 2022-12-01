import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

void main() {
  group('Addresses', () {
    final client = Client(ClientConfiguration("YOUR_API_KEY"));

    setUp(() {
      // Additional setup goes here.
    });

    test('create', () async {
      final addressData = {
        "name": "Sawyer Bateman",
        "street1": "1A Larkspur Cres.",
        "city": "St. Albert",
        "state": "AB",
        "zip": "t8n2m4",
        "country": "CA",
        "phone": "780-111-1111"
      };
      final address = await client.addresses.create(addressData);
      expect(address, isNotNull);
    });

    test('all', () async {
      final addressCollection = await client.addresses.list();
      expect(addressCollection, isNotNull);
      expect(addressCollection.addresses, isNotEmpty);
    });
  });

  group('Batch', () {
    final client = Client(ClientConfiguration("EZTK7a6b77c30c83480fa28f2cfbdece5799Pcv05nTURlVd9e79XlmZEA"));

    setUp(() {
      // Additional setup goes here.
    });

    test('create', () async {
      final batchData = {
        "name": "Thing"
      };
      final batch = await client.batches.create(batchData);
      expect(batch, isNotNull);
    });
  });
}

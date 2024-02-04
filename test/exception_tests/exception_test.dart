import 'package:easypost/easypost.dart';
import 'package:test/test.dart';
import 'package:reflectable/reflectable.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'address_service_test.reflectable.dart';

void main() {
  group('Exceptions', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("addresses", 'create');
      client.enableTestMode();

      final params = Fixtures.caAddress1;

      final address = await client.addresses.create(params);

      expect(address, isNotNull);
      expect(address, isA<Address>());
      expect(address.id, startsWith("adr_"));
      expect(address.street1, "388 Townsend St");
    });
  });
}

import 'package:easypost/easypost.dart';
import 'package:test/test.dart';
import 'package:reflectable/reflectable.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'address_service_test.reflectable.dart';

void main() {
  group('Addresses', () {
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

    test('create with verification', () async {
      Client client =
          TestUtils.setUpVCRClient("addresses", 'create_with_verification');
      client.enableTestMode();

      final params = Fixtures.incorrectAddress;

      // Creating normally (without specifying "verify") will make the address, perform no verifications
      final address = await client.addresses.create(params);

      expect(address, isNotNull);
      expect(address, isA<Address>());
      expect(address.id, startsWith("adr_"));
      expect(address.verifications?.delivery, isNull);

      // Creating with verify would make the address and perform verifications
      params.verify = true;

      final verifiedAddress = await client.addresses.create(params);

      expect(verifiedAddress, isNotNull);
      expect(verifiedAddress, isA<Address>());
      expect(verifiedAddress.id, startsWith("adr_"));
      expect(verifiedAddress.verifications?.delivery, isNotNull);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("addresses", 'retrieve');
      client.enableTestMode();

      final params = Fixtures.caAddress1;

      final address = await client.addresses.create(params);

      final retrievedAddress = await client.addresses.retrieve(address.id!);

      expect(retrievedAddress, isNotNull);
      expect(retrievedAddress, isA<Address>());
      expect(retrievedAddress.id == address.id, true);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("addresses", 'list');
      client.enableTestMode();

      final params = ListAddresses();
      params.pageSize = Fixtures.pageSize;

      final addressCollection = await client.addresses.list(parameters: params);

      expect(addressCollection, isNotNull);
      expect(addressCollection.addresses, isNotNull);
      expect(addressCollection.addresses.length <= Fixtures.pageSize, true);
      for (Address address in addressCollection.addresses) {
        expect(address, isA<Address>());
      }
    });

    test('verify', () async {
      Client client = TestUtils.setUpVCRClient("addresses", 'verify');
      client.enableTestMode();

      final params = Fixtures.caAddress1;

      final address = await client.addresses.create(params);

      final verifiedAddress = await client.addresses.verify(address);

      expect(verifiedAddress, isNotNull);
      expect(verifiedAddress, isA<Address>());
      expect(verifiedAddress.id, startsWith("adr_"));
      expect(verifiedAddress.street1, "388 TOWNSEND ST APT 20");
    });

    test('scratch', () async {
      Client client = TestUtils.setUpVCRClient("scratch", 'scratch');
      client.enableTestMode();

      final options = Options();
      options.additionalHandling = true;
      options.billingRef = "1234567890";

      final params = RetrieveRates();
      params.toAddress = Fixtures.caAddress1;
      params.fromAddress = Fixtures.caAddress2;
      params.parcel = Fixtures.basicParcel;
      params.carrierAccountIds = [Fixtures.uspsCarrierAccountId];
      params.options = options;

      final rates = await client.rates.retrieveRates(params);
    });
  });
}

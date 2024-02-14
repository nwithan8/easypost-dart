import 'package:easypost/easypost.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'carrier_account_service_test.reflectable.dart';

void main() {
  group('Carrier Accounts', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('register (create) new carrier account', () async {
      Client client = TestUtils.setUpVCRClient(
          "carrier_accounts", 'register');
      client.enableProductionMode();

      final params = Fixtures.basicCarrierAccount;

      try {
        final carrierAccount = await client.carrierAccounts.register(params);

        expect(carrierAccount, isNotNull);
        expect(carrierAccount, isA<CarrierAccount>());
        expect(carrierAccount.id, startsWith("ca_"));

        await client.carrierAccounts.delete(carrierAccount.id);
      } catch (e) {
        print(e);
      }
    });

    test('add existing carrier account', () async {
      Client client = TestUtils.setUpVCRClient(
          "carrier_accounts", 'add');
      client.enableProductionMode();

      final params = Fixtures.basicFedExCarrierAccount;

      try {
        final carrierAccount = await client.carrierAccounts.add(params);

        expect(carrierAccount, isNotNull);
        expect(carrierAccount, isA<CarrierAccount>());
        expect(carrierAccount.id, startsWith("ca_"));

        await client.carrierAccounts.delete(carrierAccount.id);
      } catch (e) {
        print(e);
      }
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("carrier_accounts", 'list');
      client.enableProductionMode();

      final List<CarrierAccount> carrierAccountsList =
          await client.carrierAccounts.list();

      expect(carrierAccountsList, isNotNull);
      // page size is not a thing for carrier account list (list, not a collection)
      // expect(carrierAccountsList.length <= Fixtures.pageSize, true);
      for (CarrierAccount account in carrierAccountsList) {
        expect(account, isA<CarrierAccount>());
      }
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("carrier_accounts", 'retrieve');
      client.enableProductionMode();

      final params = Fixtures.basicFedExCarrierAccount;

      final carrierAccount = await client.carrierAccounts.add(params);

      final retrievedCarrierAccount =
          await client.carrierAccounts.retrieve(carrierAccount.id);

      expect(retrievedCarrierAccount, isNotNull);
      expect(retrievedCarrierAccount, isA<CarrierAccount>());
      expect(retrievedCarrierAccount.id == carrierAccount.id, true);

      await client.carrierAccounts.delete(carrierAccount.id);
    });
  });

  test('update', () async {
    Client client = TestUtils.setUpVCRClient("carrier_accounts", 'update');
    client.enableProductionMode();

    final params = Fixtures.basicFedExCarrierAccount;

    final carrierAccount = await client.carrierAccounts.add(params);

    final retrievedCarrierAccount = await client.carrierAccounts.retrieve(carrierAccount.id);

    final newReference = "new reference";

    UpdateCarrierAccount updateParams = UpdateCarrierAccount();
    updateParams.reference = newReference;

    final updatedCarrierAccount = await client.carrierAccounts.update(retrievedCarrierAccount.id, updateParams);

    expect(updatedCarrierAccount, isNotNull);
    expect(updatedCarrierAccount, isA<CarrierAccount>());
    expect(updatedCarrierAccount.reference, newReference);

    await client.carrierAccounts.delete(carrierAccount.id);
  });

  test('delete', () async {
    Client client = TestUtils.setUpVCRClient("carrier_accounts", 'delete');
    client.enableProductionMode();

    final params = Fixtures.basicFedExCarrierAccount;

    final carrierAccount = await client.carrierAccounts.add(params);

    final retrievedCarrierAccount = await client.carrierAccounts.retrieve(carrierAccount.id);

    final success = await client.carrierAccounts.delete(retrievedCarrierAccount.id);

    expect(success, true);
  });
}

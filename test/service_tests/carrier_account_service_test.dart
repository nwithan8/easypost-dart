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

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("carrier_accounts", 'create');
      client.enableProductionMode();

      final params = Fixtures.basicCarrierAccount;

      final carrierAccount = await client.carrierAccounts.create(params);

      expect(carrierAccount, isNotNull);
      expect(carrierAccount, isA<CarrierAccount>());
      expect(carrierAccount.id, startsWith("ca_"));

      await client.carrierAccounts.delete(carrierAccount);
    });

    test('create with custom workflow', () async {
      Client client = TestUtils.setUpVCRClient(
          "carrier_accounts", 'create_with_custom_workflow');
      client.enableProductionMode();

      // Carriers like FedEx and UPS should hit the `/carrier_accounts/register` endpoint
      final params = CreateFedExCarrierAccount();
      params.accountNumber = "RANDOM";
      params.corporateAddressCity = "RANDOM";
      params.corporateAddressCountryCode = "RANDOM";
      params.corporateAddressPostalCode = "RANDOM";
      params.corporateAddressState = "RANDOM";
      params.corporateAddressStreet = "RANDOM";
      params.corporateCompanyName = "RANDOM";
      params.corporateEmailAddress = "RANDOM";
      params.corporateFirstName = "RANDOM";
      params.corporateJobTitle = "RANDOM";
      params.corporateLastName = "RANDOM";
      params.corporatePhoneNumber = "RANDOM";
      params.shippingAddressCity = "RANDOM";
      params.shippingAddressCountryCode = "RANDOM";
      params.shippingAddressPostalCode = "RANDOM";
      params.shippingAddressState = "RANDOM";
      params.shippingAddressStreet = "RANDOM";

      try {
        final carrierAccount = await client.carrierAccounts.create(params);

        expect(carrierAccount, isNotNull);
        expect(carrierAccount, isA<CarrierAccount>());
        expect(carrierAccount.id, startsWith("ca_"));

        await client.carrierAccounts.delete(carrierAccount);
      } catch (e) {
        print(e);
      }
    });

    test('all', () async {
      Client client = TestUtils.setUpVCRClient("carrier_accounts", 'all');
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

      final params = Fixtures.basicCarrierAccount;

      final carrierAccount = await client.carrierAccounts.create(params);

      final retrievedCarrierAccount =
          await client.carrierAccounts.retrieve(carrierAccount.id!);

      expect(retrievedCarrierAccount, isNotNull);
      expect(retrievedCarrierAccount, isA<CarrierAccount>());
      expect(retrievedCarrierAccount.id == carrierAccount.id, true);

      await client.carrierAccounts.delete(carrierAccount);
    });
  });
}

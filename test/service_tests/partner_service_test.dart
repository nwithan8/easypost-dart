import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'partner_service_test.reflectable.dart';

void main() {
  group('Partners', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('create referral customer', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'create_referral_customer', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode(); // Test mode is set to partner key

      final params = Fixtures.createReferralCustomer;

      final referralCustomer = await client.partners.createReferralCustomer(params);

      expect(referralCustomer.id, isNotNull);
      expect(referralCustomer.name, params.name);
    });

    test('retrieve referral customer', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'retrieve referral customer', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final params = Fixtures.createReferralCustomer;

      final referralCustomer = await client.partners.createReferralCustomer(params);

      final retrievedReferralCustomer = await client.partners.retrieveReferralCustomer(referralCustomer.id);

      expect(retrievedReferralCustomer, isNotNull);
      expect(retrievedReferralCustomer!.id, referralCustomer.id);
    });

    test('list referral customers', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'list referral customers', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final params = ListReferralCustomers();
      params.pageSize = Fixtures.pageSize;

      final referralCustomerCollection = await client.partners.listReferralCustomers(parameters: params);

      expect(referralCustomerCollection, isNotNull);
      expect(referralCustomerCollection.referralCustomers, isNotNull);
      expect(referralCustomerCollection.referralCustomers!.length <= Fixtures.pageSize, true);
      for (ReferralCustomer referralCustomer in referralCustomerCollection.referralCustomers!) {
        expect(referralCustomer, isA<ReferralCustomer>());
      }
    });

    test('next page of referral customers', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'next_page_of_referral_customers', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final params = ListReferralCustomers();
      params.pageSize = 1;

      final referralCustomerCollection = await client.partners.listReferralCustomers(parameters: params);

      expect(referralCustomerCollection, isNotNull);

      final nextPage = await client.partners.getNextPageOfReferralCustomers(referralCustomerCollection, pageSize: 1);

      expect(nextPage, isNotNull);
    });

    test('update referral customer', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'update_referral_customer', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final params = Fixtures.createReferralCustomer;

      final referralCustomer = await client.partners.createReferralCustomer(params);

      final updatedEmail = "adifferentemail@example.com";
      final updateParams = UpdateReferralCustomerEmail();
      updateParams.email = updatedEmail;

      final success = await client.partners.updateReferralCustomerEmail(referralCustomer.id, updateParams);

      expect(success, isTrue);

      final updatedReferralCustomer = await client.partners.retrieveReferralCustomer(referralCustomer.id);

      expect(updatedReferralCustomer, isNotNull);
      expect(updatedReferralCustomer?.id, referralCustomer.id);
      // Can't check email equality because is redacted in VCR
    });

    test('add credit card to referral customer', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'add_credit_card_to_referral_customer', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final referralCustomer = await client.partners.createReferralCustomer(Fixtures.createReferralCustomer);

      final referralCustomerApiKey = getApiKey(ApiKeyEnum.referral);
      final creditCardParams = Fixtures.addCreditCardParams;

      // Thrown because Stripe API key can't be retrieved because partner integration has not been set up for user
      expect(() async => await client.partners.addCreditCardToReferralCustomer(referralCustomerApiKey, creditCardParams), throwsA(isA<ResourceNotFoundException>()));
    });

    test('add existing Stripe payment method to referral customer', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'add_existing_stripe_payment_method_to_referral_customer', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final referralCustomer = await client.partners.createReferralCustomer(Fixtures.createReferralCustomer);

      final referralCustomerApiKey = getApiKey(ApiKeyEnum.referral);
      final stripeParams = AddExistingStripePaymentMethod();
      stripeParams.stripeCustomerId = "not-a-real-stripe-customer-id";
      stripeParams.stripePaymentMethodId = "not-a-real-stripe-payment-method-id";

      try {
        final paymentMethod = await client.partners.addExistingStripePaymentMethodToReferralCustomer(referralCustomerApiKey, stripeParams);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'BILLING.INVALID_PAYMENT_GATEWAY_REFERENCE');
      }
    });

    test('issue refund for referral customer by amount', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'issue_refund_for_referral_customer_by_amount', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final referralCustomerApiKey = getApiKey(ApiKeyEnum.referral);
      final refundParams = IssueRefund();
      refundParams.amount = 100.00;

      try {
        final refund = await client.partners.issueRefundToReferralCustomerAccount(referralCustomerApiKey, refundParams);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'TRANSACTION.AMOUNT_INVALID');
      }
    });

    test('issue refund for referral customer by payment log id', () async {
      Client client = TestUtils.setUpVCRClient("partners", 'issue_refund_for_referral_customer_by_payment_log_id', overrideTestApiKey: getApiKey(ApiKeyEnum.partner));
      client.enableTestMode();

      final referralCustomerApiKey = getApiKey(ApiKeyEnum.referral);
      final refundParams = IssueRefund();
      refundParams.paymentLogId = "not-a-real-payment-log-id";

      try {
        final refund = await client.partners.issueRefundToReferralCustomerAccount(referralCustomerApiKey, refundParams);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'TRANSACTION.DOES_NOT_EXIST');
      }
    });
  });
}

import 'package:easypost/easypost.dart';
import 'package:reflectable/reflectable.dart';
import 'package:test/test.dart';
import 'package:easypost/src/constants.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'referral_customer_service_test.reflectable.dart';

void main() {
  group('Referral Customers', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('add existing Stripe payment method', () async {
      Client client = TestUtils.setUpVCRClient("referral_customers", 'add_existing_stripe_payment_method');
      client.enableProductionMode();

      final params = AddExistingStripePaymentMethod();
      params.stripeCustomerId = 'not-a-real-stripe-customer-id';
      params.stripePaymentMethodId = 'not-a-real-stripe-payment-method-id';

      try {
        final paymentMethod = await client.referrals.addExistingStripePaymentMethod(params);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'BILLING.INVALID_PAYMENT_GATEWAY_REFERENCE');
      }
    });

    test('issue refund by amount', () async {
      Client client = TestUtils.setUpVCRClient("referral_customers", 'issue_refund_by_amount');
      client.enableProductionMode();

      final params = IssueRefund();
      params.amount = 100.00;

      try {
        final refund = await client.referrals.issueRefund(params);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'TRANSACTION.AMOUNT_INVALID');
      }
    });

    test('issue refund by payment log id', () async {
      Client client = TestUtils.setUpVCRClient("referral_customers", 'issue_refund_by_payment_log_id');
      client.enableProductionMode();

      final params = IssueRefund();
      params.paymentLogId = 'not-a-real-payment-log-id';

      try {
        final refund = await client.referrals.issueRefund(params);
        fail('Exception not thrown');
      } on ApiInvalidRequestException catch (e) {
        // Data being sent is not valid, so we expect an error
        expect(e.reason, 'TRANSACTION.DOES_NOT_EXIST');
      }
    });
  });
}

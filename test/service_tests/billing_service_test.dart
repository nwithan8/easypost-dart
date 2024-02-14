import 'package:easypost/easypost.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:test/test.dart';

import '../test_utils.dart';
import 'billing_service_test.reflectable.dart';

PaymentMethodsSummary paymentMethodSummaryMockData() {
  PaymentMethod primaryPaymentMethod = PaymentMethod(
      "card_123",
      DateTime.now(),
      DateTime.now(),
      "card",
      "test",
      null,
      null,
      null,
      null,
      null,
      null,
      "1234",
      null,
      null);
  PaymentMethod secondaryPaymentMethod = PaymentMethod(
      "bank_123",
      DateTime.now(),
      DateTime.now(),
      "bank_account",
      "test",
      "Mock Bank",
      null,
      null,
      null,
      null,
      null,
      null,
      null,
      null);
  PaymentMethodsSummary paymentMethodsSummary = PaymentMethodsSummary(
      "summary_123",
      DateTime.now(),
      DateTime.now(),
      "payment_methods_summary",
      "test",
      primaryPaymentMethod,
      secondaryPaymentMethod);

  return paymentMethodsSummary;
}

List<MockRequest> mockRequests() {
  return [
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.post,
        resourceRegex: r'bank_accounts\/\S*\/charges$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        content: "{}",
      ),
    ),
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.post,
        resourceRegex: r'credit_cards\/\S*\/charges$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        content: "{}",
      ),
    ),
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.delete,
        resourceRegex: r'bank_accounts\/\S*$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        content: "{}",
      ),
    ),
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.delete,
        resourceRegex: r'credit_cards\/\S*$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        content: "{}",
      ),
    ),
    MockRequest(
      matchRules: MockRequestMatchRules(
        method: HttpMethod.get,
        resourceRegex: r'payment_methods$',
      ),
      responseInfo: MockRequestResponseInfo(
        statusCode: 200,
        data: paymentMethodSummaryMockData(),
      ),
    ),
  ];
}

void main() {
  group('Billing', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    // TODO: Add billing functionality
    test('fund wallet', () async {
      Client client = TestUtils.setUpVCRClient("billing", 'fund_wallet');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      final params = FundWallet();
      params.amount = 1000;

      final success = await mockClient.billing
          .fundWallet(params, priority: PaymentMethodPriority.primary);

      expect(success, isTrue);
    });

    test('fund wallet no priority level', () async {
      Client client =
          TestUtils.setUpVCRClient("billing", 'fund_wallet_no_priority');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      final params = FundWallet();
      params.amount = 1000;

      final success = await mockClient.billing.fundWallet(params);

      expect(success, isTrue);
    });

    test('retrieve payment methods summary', () async {
      Client client = TestUtils.setUpVCRClient(
          "billing", 'retrieve_payment_methods_summary');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      final summary = await mockClient.billing.retrievePaymentMethods();

      expect(summary.primaryPaymentMethod, isNotNull);
      expect(summary.secondaryPaymentMethod, isNotNull);
    });

    test('retrieve payment methods summary no id', () async {
      Client client = TestUtils.setUpVCRClient(
          "billing", 'retrieve_payment_methods_summary_no_id');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests([
        MockRequest(
          matchRules: MockRequestMatchRules(
            method: HttpMethod.get,
            resourceRegex: r'payment_methods$',
          ),
          responseInfo: MockRequestResponseInfo(
            statusCode: 200,
            content:
                '{"id": null}', // No ID, will throw exception when trying to interact with summary
          ),
        ),
      ]);

      expect(
        () async => await mockClient.billing.retrievePaymentMethods(),
        throwsA(isA<PaymentMethodsNotInitializedException>()),
      );
    });

    test('delete payment method', () async {
      Client client =
          TestUtils.setUpVCRClient("billing", 'delete_payment_method');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      final success = await mockClient.billing
          .deletePaymentMethod(PaymentMethodPriority.primary);

      expect(success, isTrue);
    });

    test('get payment method by priority switch case', () async {
      Client client = TestUtils.setUpVCRClient(
          "billing", 'get_payment_method_by_priority_switch_case');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests(mockRequests());

      // Deleting a payment method retrieves the payment method internally, which should test the switch case
      await mockClient.billing
          .deletePaymentMethod(PaymentMethodPriority.primary);
      // The payment method is not exposed by this method, so we can't assert against it. If this test doesn't throw an exception, it worked

      // This time the internal case should use the secondary payment method. Again, if there's no exception thrown, it worked.
      await mockClient.billing
          .deletePaymentMethod(PaymentMethodPriority.secondary);

      // Now if we pass in a bad priority level, it should throw an exception as the default for the switch case
      // Because this method only accepts enums (well, the custom enum class, but one that can't be extended/modified), we can't actually pass in a bad value.
      // Therefore, something would have to be wildly unpredictable and horrible for this to actually error out for an end user.
    });

    test('get payment method by priority no payment method', () async {
      Client client = TestUtils.setUpVCRClient(
          "billing", 'get_payment_method_by_priority_no_payment_method');
      client.enableTestMode();

      MockClient mockClient = MockClient(client);
      mockClient.addMockRequests([
        MockRequest(
          matchRules: MockRequestMatchRules(
            method: HttpMethod.get,
            resourceRegex: r'payment_methods$',
          ),
          responseInfo: MockRequestResponseInfo(
            statusCode: 200,
            content:
                '{"id": "summary_123", "primary_payment_method": null, "secondary_payment_method": null}', // No payment methods, will throw exception when trying to interact with summary
          ),
        ),
      ]);

      expect(
        () async => await mockClient.billing
            .deletePaymentMethod(PaymentMethodPriority.primary),
        throwsA(isA<ResourceNotFoundException>()),
      );
    });
  });
}

import 'package:easypost/easypost.dart';
import 'package:easypost/src/internal/crypto.dart';
import 'package:test/test.dart';

import '../fixtures.dart';
import '../test_utils.dart';
import 'webhook_service_test.reflectable.dart';

void main() {
  group('Webhooks', () {
    setUp(() {
      // Additional setup goes here.
      initializeReflectable();
    });

    test('validate webhook success', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "validate_webhook_success");
      client.enableTestMode();

      final webhookData = Fixtures.webhookEventBody;
      final webhookSecret = Fixtures.webhookSecret;
      final webhookHeader = Fixtures.eventWebhookHeader;

      final webhookValid = await client.webhooks.validateIncomingWebhookEvent(
        webhookData,
        webhookHeader,
        webhookSecret,
      );

      expect(webhookValid, true);
    });

    test('validate webhook fails with invalid signature', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "validate_webhook_fails_with_invalid_signature");
      client.enableTestMode();

      final webhookData = Fixtures.webhookEventBody;
      final webhookSecret = "invalid_secret";
      final webhookHeader = Fixtures.eventWebhookHeader;

      final webhookValid = await client.webhooks.validateIncomingWebhookEvent(
        webhookData,
        webhookHeader,
        webhookSecret,
      );

      expect(webhookValid, false);
    });

    test('validate webhook fails with missing signature', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "validate_webhook_fails_with_missing_signature");
      client.enableTestMode();

      final webhookData = Fixtures.webhookEventBody;
      final webhookSecret = Fixtures.webhookSecret;
      final webhookHeader = {
        "not-a-signature": "not-a-signature",
      };

      // Should raise an exception
      try {
        final webhookValid = await client.webhooks.validateIncomingWebhookEvent(
          webhookData,
          webhookHeader,
          webhookSecret,
        );
        expect(true, false); // Should not reach this line
      } catch (e) {
        expect(e, isA<SignatureValidationException>());
      }
    });
  });
}

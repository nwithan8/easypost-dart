import 'package:easypost/easypost.dart';
import 'package:easypost/src/constants.dart';
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

    test('create', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "create");
      client.enableTestMode();

      final createWebhookParams = Fixtures.createWebhook("create");

      final webhook = await client.webhooks.create(createWebhookParams);

      expect(webhook, isNotNull);
      expect(webhook, isA<Webhook>());
      expect(webhook.id, startsWith(ModelPrefixes.webhook));
      expect(webhook.url, createWebhookParams.url);

      await client.webhooks.delete(webhook.id);
    });

    test('retrieve', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "retrieve");
      client.enableTestMode();

      final createWebhookParams = Fixtures.createWebhook("retrieve");

      final webhook = await client.webhooks.create(createWebhookParams);

      final retrievedWebhook = await client.webhooks.retrieve(webhook.id);

      expect(retrievedWebhook, isNotNull);
      expect(retrievedWebhook, isA<Webhook>());
      expect(retrievedWebhook.id, webhook.id);

      await client.webhooks.delete(webhook.id);
    });

    test('list', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "list");
      client.enableTestMode();

      final createWebhookParams = Fixtures.createWebhook("list");

      final webhook = await client.webhooks.create(createWebhookParams);

      final webhooksList = await client.webhooks.list();

      expect(webhooksList, isNotNull);
      expect(webhooksList, isA<List<Webhook>>());
      expect(webhooksList.length, greaterThan(0));
      expect(webhooksList.any((element) => element.id == webhook.id), true);

      await client.webhooks.delete(webhook.id);
    });

    test('enable', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "enable");
      client.enableTestMode();

      final createWebhookParams = Fixtures.createWebhook("enable");

      final webhook = await client.webhooks.create(createWebhookParams);

      expect(webhook.disabledAt, isNull);

      final success = await client.webhooks.enable(webhook.id);

      expect(success, true);

      await client.webhooks.delete(webhook.id);
    });

    test('delete', () async {
      Client client = TestUtils.setUpVCRClient("webhooks", "delete");
      client.enableTestMode();

      final createWebhookParams = Fixtures.createWebhook("delete");

      final webhook = await client.webhooks.create(createWebhookParams);

      final success = await client.webhooks.delete(webhook.id);

      expect(success, true);
    });

    test('validate webhook success', () async {
      Client client =
          TestUtils.setUpVCRClient("webhooks", "validate_webhook_success");
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
      Client client = TestUtils.setUpVCRClient(
          "webhooks", "validate_webhook_fails_with_invalid_signature");
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
      Client client = TestUtils.setUpVCRClient(
          "webhooks", "validate_webhook_fails_with_missing_signature");
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

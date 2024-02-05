import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/create_webhook.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/list_webhooks.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/update_webhook.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/signature_validation_exception.dart';
import 'package:easypost/src/internal/crypto.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/webhook.dart';

/// The [WebhookService] handles webhooks with the EasyPost API.
class WebhookService extends Service {
  WebhookService(Client client) : super(client);

  /// Creates a [Webhook].
  Future<Webhook> create(CreateWebhook parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
      HttpMethod.post,
      'webhooks',
      ApiVersion.v2,
      parameters: parameterMap,
    );
    return Webhook.fromJson(json);
  }

  /// Retrieves a [Webhook].
  Future<Webhook> retrieve(String webhookId) async {
    final json = await client.requestJson(
      HttpMethod.get,
      'webhooks/$webhookId',
      ApiVersion.v2,
    );
    return Webhook.fromJson(json);
  }

  /// Lists all [Webhook]s.
  Future<List<Webhook>> list({ListWebhooks? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'webhooks', ApiVersion.v2,
        parameters: parameterMap, rootElement: 'webhooks');
    return json.map<Webhook>((json) => Webhook.fromJson(json)).toList();
  }

  /// Updates a [Webhook].
  Future<Webhook> update(String webhookId, UpdateWebhook parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/$webhookId', ApiVersion.v2,
        parameters: parameterMap);
    return Webhook.fromJson(json);
  }

  /// Toggle a [Webhook].
  Future<bool> toggle(String webhookId) async {
    return await client.request(
        HttpMethod.patch, 'webhooks/$webhookId', ApiVersion.v2);
  }

  /// Deletes a [Webhook].
  Future<bool> delete(String webhookId) async {
    return await client.request(
        HttpMethod.delete, 'webhooks/$webhookId', ApiVersion.v2);
  }

  /// Verifies a webhook [Event].
  /// Returns `true` if the signature is valid, `false` otherwise.
  /// Throws a [SignatureValidationException] if the signature validation process fails.
  Future<bool> validateIncomingWebhookEvent(
      List<int> body, Map<String, dynamic> headers, String secret) async {
    // check for signature header
    if (!headers.containsKey(webhookSignatureHeader)) {
      throw SignatureValidationException(
          ErrorMessages.missingWebhookSignature);
    }

    final providedSignature = headers[webhookSignatureHeader];

    final computedHash = hmacSha256HashFromBytes(body, secret);
    final expectedSignature = 'hmac-sha256-hex=$computedHash';

    // check for matching signatures
    return signaturesMatch(providedSignature, expectedSignature);
  }
}

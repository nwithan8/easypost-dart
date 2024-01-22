import 'dart:convert';

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/list_webhooks.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/create_webhook.dart';
import 'package:easypost/src/api/parameters/v2/webhooks/update_webhook.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/webhook.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/internal/crypto.dart';

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
  Future<Webhook> retrieve(String id) async {
    final json =  await client.requestJson(
      HttpMethod.get,
      'webhooks/$id',
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

  /// Verifies a webhook [Event].
  Future<Event?> validateIncomingWebhookEvent(List<int> body, Map<String, String> headers, String secret) async {
    // TODO: Verify this works.
    const String signatureHeader = 'X-Hmac-Signature';

    // check for signature header
    if (!headers.containsKey(signatureHeader)) {
      throw Exception('Signature header not found');
    }

    final providedSignature = headers[signatureHeader];

    final computedHash = hmacSha256HexFromBytes(body, secret);
    final computedHashHexString = bytesToHex(computedHash.bytes);
    final expectedSignature = 'hmac-sha256-hex=$computedHashHexString';

    // check for matching signatures
    if (!signaturesMatch(providedSignature, expectedSignature)) {
      throw Exception('Signature header does not match expected signature');
    }

    dynamic json = jsonDecode(utf8.decode(body));
    return Event.fromJson(json);
  }

  /// Updates a [Webhook].
  Future<Webhook> update(Webhook webhook, UpdateWebhook parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/${webhook.id}', ApiVersion.v2,
        parameters: parameterMap);
    return Webhook.fromJson(json);
  }

  /// Toggle a [Webhook].
  Future<Webhook> toggle(Webhook webhook) async {
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/${webhook.id}', ApiVersion.v2);
    return Webhook.fromJson(json);
  }

  /// Deletes a [Webhook].
  Future<bool> delete(Webhook webhook) async {
    return await client.request(
        HttpMethod.delete, 'webhooks/${webhook.id}', ApiVersion.v2);
  }
}

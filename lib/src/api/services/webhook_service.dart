import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/webhook.dart';
import 'package:easypost/src/api/parameters/webhooks.dart';

/// The [WebhookService] handles webhooks with the EasyPost API.
class WebhookService extends Service {
  WebhookService(Client client) : super(client);

  /// Creates a [Webhook].
  Future<Webhook> create(WebhooksCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'webhooks',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  /// Retrieves a [Webhook].
  Future<Webhook> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'webhooks/$id',
      ApiVersion.v2,
    );
  }

  /// Lists all [Webhook]s.
  Future<List<Webhook>> list({WebhooksAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'webhooks', ApiVersion.v2,
        parameters: parameterMap, rootElement: 'webhooks');
    return json.map<Webhook>((json) => Webhook.fromJson(json)).toList();
  }

  /// Verifies a webhook [Event].
  Future<Event> validateIncomingWebhookEvent() async {
    // TODO: Handle this method.
    throw UnimplementedError();
  }

  /// Updates a [Webhook].
  Future<Webhook> update(Webhook webhook, WebhooksUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
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
    return await client.requestJson(
        HttpMethod.delete, 'webhooks/${webhook.id}', ApiVersion.v2);
  }
}

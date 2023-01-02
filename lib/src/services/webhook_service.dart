import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/webhook.dart';
import 'package:easypost/src/parameters/webhooks.dart';

class WebhookService extends Service {
  WebhookService(Client client) : super(client);

  Future<Webhook> create(WebhooksCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    return await client.requestJson(
      HttpMethod.post,
      'webhooks',
      ApiVersion.v2,
      parameters: parameterMap,
    );
  }

  Future<Webhook> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'webhooks/$id',
      ApiVersion.v2,
    );
  }

  Future<List<Webhook>> list({WebhooksAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'webhooks', ApiVersion.v2,
        parameters: parameterMap, rootElement: 'webhooks');
    return json.map<Webhook>((json) => Webhook.fromJson(json)).toList();
  }

  Future<Event> validateIncomingWebhookEvent() async {
    // TODO: Handle this method.
    throw UnimplementedError();
  }

  Future<Webhook> update(Webhook webhook, WebhooksUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client: client);
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/${webhook.id}', ApiVersion.v2,
        parameters: parameterMap);
    return Webhook.fromJson(json);
  }

  Future<Webhook> toggle(Webhook webhook) async {
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/${webhook.id}', ApiVersion.v2);
    return Webhook.fromJson(json);
  }

  Future<bool> delete(Webhook webhook) async {
    return await client.requestJson(
        HttpMethod.delete, 'webhooks/${webhook.id}', ApiVersion.v2);
  }
}

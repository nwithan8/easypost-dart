import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/parameters.dart';
import 'package:easypost/src/models/webhook.dart';
import 'package:easypost/src/models/event.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/calculations/rates.dart';

class WebhookService extends Service {
  WebhookService(Client client) : super(client);

  Future<Webhook> create(Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.post,
      'webhooks',
      ApiVersion.v2,
      parameters: parameters.wrap(['webhook']),
    );
  }

  Future<Webhook> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'webhooks/$id',
      ApiVersion.v2,
    );
  }

  Future<List<Webhook>> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'webhooks', ApiVersion.v2,
        parameters: filters, rootElement: 'webhooks');
    return json.map<Webhook>((json) => Webhook.fromJson(json)).toList();
  }

  Future<Event> validateIncomingWebhookEvent() async {
    // TODO: Handle this method.
    throw UnimplementedError();
  }

  Future<Webhook> update(
      Webhook webhook, Map<String, dynamic> parameters) async {
    final json = await client.requestJson(
        HttpMethod.patch, 'webhooks/${webhook.id}', ApiVersion.v2,
        parameters: parameters);
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

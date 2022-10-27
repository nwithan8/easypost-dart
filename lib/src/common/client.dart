import 'dart:async';
import 'dart:convert';

import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/services.dart';
import 'package:easypost/src/common/client_configuration.dart';
import 'package:http/http.dart' as http;

///  The Main EasyPost Client
///
///  ## Example
///
///       var client = new Client(auth: new Authentication.withToken("SomeToken"));
///       // Use the Client
///
class Client {
  /// HTTP Client
  final ClientConfiguration config;

  /// Creates a new [Client] instance.
  Client(this.config);

  /// Service for address-related methods of the EasyPost API.
  AddressService get addresses => AddressService(this);

  /// Service for batch-related methods of the EasyPost API.
  BatchService get batches => BatchService(this);

  /// Service for shipment-related methods of the EasyPost API.
  ShipmentService get shipments => ShipmentService(this);

  Future<http.Response> _executeRequest(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) async {
    final request =
        _prepareRequest(method, url, apiVersion, parameters: parameters);

    final streamedResponse = await config.client?.send(request);

    if (streamedResponse == null) {
      throw Exception("No Response");
    }

    switch (streamedResponse.statusCode) {
      case 404:
        throw Exception('Requested Resource was Not Found');
      case 401:
        throw Exception('Unauthorized');
      case 400:
        throw Exception('Bad Request');
      case 422:
        throw Exception('Unprocessable Entity');
      case 500:
      case 502:
      case 504:
        throw Exception('Server Error');
    }

    return await http.Response.fromStream(streamedResponse);
  }

  Future<bool> request(HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    try {
      await _executeRequest(method, url, apiVersion, parameters: parameters);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> requestJson(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    final response =
        await _executeRequest(method, url, apiVersion, parameters: parameters);

    dynamic json = jsonDecode(response.body);

    if (rootElement != null) {
      json = json[rootElement];
    }

    return json;
  }

  http.Request _prepareRequest(
      HttpMethod method, String endpoint, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) {
    final url = '${config.fullBaseUrl}/$endpoint';

    final http.Request request =
        http.Request(method.value, Uri.parse(url.toString()));

    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ${config.apiKey}';

    if (parameters != null) {
      request.body = jsonEncode(parameters);
    }

    return request;
  }
}

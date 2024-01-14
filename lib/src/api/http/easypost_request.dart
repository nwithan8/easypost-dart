import 'dart:convert';

import 'package:easypost/src/api/client_configuration.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/http/streamed_response.dart';
import 'package:easypost/src/exceptions/api/api_exception.dart';
import 'package:http/http.dart' as http;

/// A class that represents an HTTP request to the EasyPost API.
class EasyPostRequest {
  /// Executes a request to the EasyPost API.
  static Future<http.Response> executeRequest(ClientConfiguration config,
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) async {
    final request = _prepareRequest(config, method, url, apiVersion,
        parameters: parameters);

    final streamedResponse = await config.client.send(request);

    if (streamedResponse.isError) {
      // request returned an error, throw the appropriate exception
      throw await ApiException.fromStreamedResponse(streamedResponse);
    }

    return await http.Response.fromStream(streamedResponse);
  }

  /// Prepares a request to be sent to the EasyPost API.
  static http.Request _prepareRequest(ClientConfiguration config,
      HttpMethod method, String endpoint, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) {
    // Prepare the URL
    Uri uri = Uri.parse('${config.fullBaseUrl}/$endpoint');

    if (parameters != null &&
        (method == HttpMethod.get || method == HttpMethod.delete)) {
      // Add query parameters to a GET/DELETE request URL
      // Each value in the parameters needs to be a String
      uri = uri.replace(
          queryParameters:
              parameters.map((key, value) => MapEntry(key, value.toString())));
    }

    // Create the request
    final http.Request request = http.Request(method.value, uri);

    // Add the headers
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ${config.apiKey}';
    // request.headers['User-Agent'] = config.userAgent;

    // Add body to a POST/PUT/PATCH request
    if (parameters != null &&
        (method == HttpMethod.post ||
            method == HttpMethod.put ||
            method == HttpMethod.patch)) {
      request.body = jsonEncode(parameters);
    }

    return request;
  }
}

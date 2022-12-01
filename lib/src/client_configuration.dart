import 'package:easypost/src/http/api_version.dart';
import 'package:http/http.dart' as http;

class ClientConfiguration {
  /// API key
  final String apiKey;

  /// API base URL
  final String baseUrl;

  /// API version
  final ApiVersion apiVersion;

  /// HTTP Client
  http.Client? client;

  /// The User-Agent header to use for all requests.
  String? get userAgent => 'EasyPost/$apiVersion DartClient';

  /// Creates a new [ClientConfiguration] instance.
  ///
  /// [apiKey] is the API key to use for authentication.
  /// [apiVersion] is the API version to use. Defaults to "v2".
  /// [baseUrl] is the API base URL to use. Defaults to "https://api.easypost.com".
  /// [httpClient] is the HTTP client to use. Defaults to a new [http.Client].
  ClientConfiguration(
    this.apiKey, {
    this.apiVersion = ApiVersion.v2,
    this.baseUrl = 'https://api.easypost.com',
    http.Client? httpClient,
  }) : client = httpClient ?? http.Client();

  String get fullBaseUrl => '$baseUrl/${apiVersion.value}';
}

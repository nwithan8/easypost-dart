import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/hooks.dart';
import 'package:easypost/src/api/services/extras_service.dart';
import 'package:http/http.dart' as http;

class ClientConfiguration {
  /// Whether the client is in test mode.
  ///
  /// Set to `true` by default.
  bool _inTestMode = true;

  /// Customizable function that returns a boolean value.
  Function? _boolFunction;

  /// Switches the client to production mode.
  void enableProductionMode() {
    _inTestMode = false;
  }

  /// Switches the client to test mode.
  void enableTestMode() {
    _inTestMode = true;
  }

  /// Executes the [_boolFunction] and returns the result. Returns `false` if the function is `null`.
  bool get boolFunctionResult => _boolFunction?.call() ?? false;

  /// Get the current API key depending on the mode.
  String get apiKey => _inTestMode ? _testApiKey : _productionApiKey;

  /// Test API key
  final String _testApiKey;

  /// Production API key
  final String _productionApiKey;

  /// API base URL
  final String baseUrl;

  /// API version
  final ApiVersion apiVersion;

  /// Pre-flight and post-flight hooks
  final Hooks? hooks;

  /// HTTP Client
  http.Client client;

  /// The User-Agent header to use for all requests.
  String get userAgent => getUserAgent(apiVersion);

  static String getUserAgent(ApiVersion apiVersion) {
    return 'EasyPost/$apiVersion DartClient';
  }

  /// Creates a new [ClientConfiguration] instance.
  ///
  /// [_testApiKey] is the Test API key to use for authentication.
  /// [_productionApiKey] is the Production API key to use for authentication.
  /// [apiVersion] is the API version to use. Defaults to "v2".
  /// [baseUrl] is the API base URL to use. Defaults to "https://api.easypost.com".
  /// [httpClient] is the HTTP client to use. Defaults to a new [http.Client].
  ClientConfiguration(
    this._testApiKey,
    this._productionApiKey, {
    this.apiVersion = ApiVersion.v2,
    this.baseUrl = 'https://api.easypost.com',
    this.hooks,
    http.Client? httpClient,
    Function? boolFunction,
  }) : client = httpClient ?? http.Client() {
    _boolFunction = boolFunction;
  }

  static Future<ClientConfiguration> fromEmailAndPassword(
    String email,
    String password, {
    ApiVersion apiVersion = ApiVersion.v2,
    String baseUrl = 'https://api.easypost.com',
    Hooks? hooks,
    http.Client? httpClient,
    Function? boolFunction,
  }) async {
    String authCookie =
        await ExtrasService.logInWithEmailAndPasswordReturnAuthCookie(
            email, password);
    ApiKeyPair apiKeys = await ExtrasService.getApiKeysUsingCookie(authCookie);

    return ClientConfiguration(
      apiKeys.testKey!,
      apiKeys.productionKey!,
      apiVersion: apiVersion,
      baseUrl: baseUrl,
      hooks: hooks,
      httpClient: httpClient,
      boolFunction: boolFunction,
    );
  }

  String fullBaseUrl([ApiVersion? apiVersion]) {
    return '$baseUrl/${apiVersion?.value ?? this.apiVersion.value}';
  }
}

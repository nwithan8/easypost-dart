import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:easypost/src/api/http/http_method.dart';
import 'package:dartvcr/dartvcr.dart';
import 'package:easypost/easypost.dart';

enum ApiKeyEnum { test, production, partner, referral, mock }

String getApiKey(ApiKeyEnum keyType) {
  String keyName = "";
  switch (keyType) {
    case ApiKeyEnum.test:
      keyName = "EASYPOST_TEST_API_KEY";
      break;
    case ApiKeyEnum.production:
      keyName = "EASYPOST_PROD_API_KEY";
      break;
    case ApiKeyEnum.partner:
      keyName = "PARTNER_USER_PROD_API_KEY";
      break;
    case ApiKeyEnum.referral:
      keyName = "REFERRAL_CUSTOMER_PROD_API_KEY";
      break;
    case ApiKeyEnum.mock:
      keyName =
          "EASYPOST_MOCK_API_KEY"; // does not exist, will trigger to use ApiKeyFailedToPull
      break;
  }
  return Platform.environment[keyName] ??
      TestUtils
          ._apiKeyFailedToPull; // if can't pull from environment, will use a fake key. Won't matter on replay.
}

class TestUtils {
  static final String _apiKeyFailedToPull = "couldnotpullapikey";

  static final List<String> _bodyCensors = [
    "api_keys",
    "children",
    "client_ip",
    "credentials",
    "email",
    "key",
    "keys",
    "phone_number",
    "phone",
    "test_credentials",
  ];

  static final List<String> _headerCensors = [
    "Authorization",
    "User-Agent",
  ];

  static final List<String> _queryCensors = [
    "card[number]",
    "card[cvc]",
  ];

  static String getSourceFileDirectory() {
    return Directory.current.path;
  }

  static bool directoryExists(String folderPath) {
    return Directory(folderPath).existsSync();
  }

  static bool fileExists(String filePath) {
    return File(filePath).existsSync();
  }

  static void createFolderIfNeeded(String folderPath) {
    if (!directoryExists(folderPath)) {
      Directory(folderPath).createSync(recursive: true);
    }
  }

  static void createFileIfNeeded(String filePath) {
    if (!fileExists(filePath)) {
      File(filePath).createSync(recursive: true);
    }
  }

  static String readFile(String filePath) {
    File file = File(filePath);
    return file.readAsStringSync();
  }

  static String readFirstLineOfFile(String filePath) {
    File file = File(filePath);
    return file.readAsLinesSync().first;
  }

  static Client setUpVCRClient(String groupName, String cassetteName,
      {String? overrideTestApiKey, String? overrideProductionApiKey}) {
    TestVCR vcr = TestVCR(testCassettesFolder: groupName);
    return vcr.setUpClient(cassetteName,
        overrideTestApiKey: overrideTestApiKey,
        overrideProductionApiKey: overrideProductionApiKey);
  }

  static Client setUpLiveClient(
      {String? overrideTestApiKey, String? overrideProductionApiKey}) {
    String testApiKey = overrideTestApiKey ?? getApiKey(ApiKeyEnum.test);
    String productionApiKey =
        overrideProductionApiKey ?? getApiKey(ApiKeyEnum.production);
    ClientConfiguration config =
        ClientConfiguration(testApiKey, productionApiKey);
    return Client(config);
  }
}

class TestVCR {
  static const String _cassettesFolder = 'cassettes';

  late String _testApiKey;

  late String _productionApiKey;

  late String _testCassettesFolder;

  late VCR _vcr;

  TestVCR({String? testCassettesFolder}) {
    Censors censors = Censors(censorString: "<REDACTED>");
    censors.censorBodyElementsByKeys(TestUtils._bodyCensors);
    censors.censorHeaderElementsByKeys(TestUtils._headerCensors);
    censors.censorQueryElementsByKeys(TestUtils._queryCensors);

    AdvancedOptions advancedOptions = AdvancedOptions(
      matchRules: MatchRules.defaultStrictMatchRules,
      censors: censors,
      simulateDelay: false,
      manualDelay: 0,
      validTimeFrame: TimeFrame.months6,
      whenExpired: ExpirationAction.warn,
    );
    _vcr = VCR(advancedOptions: advancedOptions);

    _testApiKey = getApiKey(ApiKeyEnum.test);
    _productionApiKey = getApiKey(ApiKeyEnum.production);

    _testCassettesFolder =
        "${TestUtils.getSourceFileDirectory()}/$_cassettesFolder"; // create "cassettes" folder in same directory as test files
    if (testCassettesFolder != null) {
      _testCassettesFolder =
          "$_testCassettesFolder/$testCassettesFolder"; // create subfolder for each test group
    }
    TestUtils.createFolderIfNeeded(_testCassettesFolder);
  }

  bool get isRecording => _vcr.mode == Mode.record;

  Client setUpClient(String cassetteName,
      {String? overrideTestApiKey, String? overrideProductionApiKey}) {
    // override api key if needed
    String testApiKey = overrideTestApiKey ?? _testApiKey;
    String productionApiKey = overrideProductionApiKey ?? _productionApiKey;

    // set up cassette
    Cassette cassette = Cassette(_testCassettesFolder, cassetteName);

    // add cassette to vcr
    _vcr.insert(cassette);

    String filePath = "$_testCassettesFolder/$cassetteName" ".json";
    if (!TestUtils.fileExists(filePath)) {
      // if cassette doesn't exist, switch to record mode
      _vcr.mode = Mode.record;
    } else {
      // if cassette exists, switch to replay mode
      _vcr.mode = Mode.replay;
    }

    // get EasyPost client
    ClientConfiguration config = ClientConfiguration(
        testApiKey, productionApiKey,
        httpClient: _vcr.client, boolFunction: () => _vcr.mode == Mode.record);
    return Client(config);
  }
}

class MockRequestMatchRules {
  final HttpMethod method;

  final String resourceRegex;

  MockRequestMatchRules({required this.method, required this.resourceRegex});
}

class MockRequestResponseInfo {
  final int statusCode;

  final String? content;

  final dynamic? data;

  MockRequestResponseInfo({required this.statusCode, this.content, this.data});
}

class MockRequest {
  final MockRequestMatchRules matchRules;

  final MockRequestResponseInfo responseInfo;

  MockRequest({required this.matchRules, required this.responseInfo});
}

class MockClient extends Client {
  late List<MockRequest> _mockRequests = [];

  MockClient(Client client) : super(client.config);

  void addMockRequest(MockRequest mockRequest) {
    _mockRequests.add(mockRequest);
  }

  void addMockRequests(List<MockRequest> mockRequests) {
    _mockRequests.addAll(mockRequests);
  }

  MockRequest? findMatchingMockRequest(HttpMethod method, String resource) {
    for (MockRequest mockRequest in _mockRequests) {
      if (methodMatches(method, mockRequest.matchRules.method) &&
          endpointMatches(resource, mockRequest.matchRules.resourceRegex)) {
        return mockRequest;
      }
    }
    return null;
  }

  bool methodMatches(HttpMethod method, HttpMethod toMatch) {
    return method == toMatch;
  }

  bool endpointMatches(String resource, String resourceRegex) {
    return RegExp(resourceRegex).hasMatch(resource);
  }

  @override
  Future<bool> request(HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    MockRequest? mockRequest = findMatchingMockRequest(method, url);
    if (mockRequest == null) {
      throw Exception("No matching mock request found");
    }

    return true;
  }

  @override
  Future<dynamic> requestJson(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    MockRequest? mockRequest = findMatchingMockRequest(method, url);
    if (mockRequest == null) {
      throw Exception("No matching mock request found");
    }

    String content = "{}";

    if (mockRequest.responseInfo.content != null) {
      content = mockRequest.responseInfo.content!;
    } else if (mockRequest.responseInfo.data != null) {
      content = jsonEncode(mockRequest.responseInfo.data);
    }

    dynamic json = jsonDecode(content);

    if (rootElement != null) {
      json = json[rootElement];
    }

    return json;
  }
}

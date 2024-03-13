import 'package:easypost/src/api/http/http_method.dart';
import 'package:http/http.dart' as http;

class Hooks {
  final List<Function> _preFlightCallbacks = [];

  final List<Function> _postFlightCallbacks = [];

  void addPreFlightCallback(
      Future<void> Function(PreFlightCallbackData data) callback) {
    _preFlightCallbacks.add(callback);
  }

  void clearPreFlightCallbacks() {
    _preFlightCallbacks.clear();
  }

  Future<void> callPreFlightCallbacks(
      http.Request request, int timestamp, String requestResponsePairId) async {
    for (var callback in _preFlightCallbacks) {
      final params =
          PreFlightCallbackData(request, timestamp, requestResponsePairId);
      await callback(params);
    }
  }

  void addPostFlightCallback(
      Future<void> Function(PostFlightCallbackData data) callback) {
    _postFlightCallbacks.add(callback);
  }

  void clearPostFlightCallbacks() {
    _postFlightCallbacks.clear();
  }

  Future<void> callPostFlightCallbacks(http.StreamedResponse response,
      int requestTimestamp, String requestResponsePairId) async {
    final responseTimestamp = DateTime.now().millisecondsSinceEpoch;
    for (var callback in _postFlightCallbacks) {
      final params = PostFlightCallbackData(
          response, responseTimestamp, requestTimestamp, requestResponsePairId);
      await params.setResponse();
      await callback(params);
    }
  }
}

class PreFlightCallbackData {
  final http.Request _request;

  final int timestamp;

  final String requestResponsePairId;

  HttpMethod get method => HttpMethodExtension.fromString(_request.method);

  String get url => _request.url.toString();

  Map<String, String> get headers => _request.headers;

  String get body => _request.body;

  PreFlightCallbackData(
      this._request, this.timestamp, this.requestResponsePairId);
}

class PostFlightCallbackData {
  final http.StreamedResponse _streamedResponse;

  late http.Response _response;

  final int timestamp;

  final int requestTimestamp;

  final String requestResponsePairId;

  int get statusCode => _response.statusCode;

  String? get reasonPhrase => _response.reasonPhrase;

  Map<String, String> get headers => _response.headers;

  String get body => _response.body;

  int get flightTime => timestamp - requestTimestamp;

  Future<void> setResponse() async {
    _response = await http.Response.fromStream(_streamedResponse);
  }

  PostFlightCallbackData(this._streamedResponse, this.timestamp,
      this.requestTimestamp, this.requestResponsePairId);
}

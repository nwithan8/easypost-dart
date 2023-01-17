import 'package:http/http.dart' as http;

extension StreamedResponseExtension on http.StreamedResponse {
  /// Returns true if the response status code is in the 1xx range.
  bool get isInformational => statusCode >= 100 && statusCode < 200;

  /// Returns true if the response status code is in the 2xx range.
  bool get isSuccessful => statusCode >= 200 && statusCode < 300;

  /// Returns true if the response status code is in the 3xx range.
  bool get isRedirect => statusCode >= 300 && statusCode < 400;

  /// Returns true if the response status code is in the 4xx or 5xx range.
  bool get isError => statusCode >= 400 && statusCode < 600;

  /// Returns true if the response status code is in the 4xx range.
  bool get isClientError => statusCode >= 400 && statusCode < 500;

  /// Returns true if the response status code is in the 5xx range.
  bool get isServerError => statusCode >= 500 && statusCode < 600;
}

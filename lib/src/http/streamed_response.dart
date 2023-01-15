import 'package:http/http.dart' as http;

extension StreamedResponseExtension on http.StreamedResponse {
  bool get isInformational => statusCode >= 100 && statusCode < 200;

  bool get isSuccessful => statusCode >= 200 && statusCode < 300;

  bool get isRedirect => statusCode >= 300 && statusCode < 400;

  bool get isError => statusCode >= 400 && statusCode < 600;

  bool get isClientError => statusCode >= 400 && statusCode < 500;

  bool get isServerError => statusCode >= 500 && statusCode < 600;
}

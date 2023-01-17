import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 503 Service Unavailable error occurs.
class ApiServiceUnavailableException extends ApiException {
  const ApiServiceUnavailableException(super.message, super.statusCode, super.reason,
      {super.errors});
}

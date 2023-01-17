import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 408 Timeout error occurs.
class ApiTimeoutException extends ApiException {
  const ApiTimeoutException(super.message, super.statusCode, super.reason,
      {super.errors});
}

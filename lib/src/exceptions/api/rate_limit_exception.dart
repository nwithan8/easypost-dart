import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 429 Rate Limit error occurs.
class ApiRateLimitException extends ApiException {
  const ApiRateLimitException(super.message, super.statusCode, super.reason,
      {super.errors});
}

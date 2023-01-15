import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiRateLimitException extends ApiException {
  const ApiRateLimitException(super.message, super.statusCode, super.reason,
      {super.errors});
}

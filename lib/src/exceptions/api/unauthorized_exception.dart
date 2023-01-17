import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 401 or 403 Unauthorized error occurs.
class ApiUnauthorizedException extends ApiException {
  const ApiUnauthorizedException(super.message, super.statusCode, super.reason,
      {super.errors});
}

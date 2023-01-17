import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 405 Method Not Allowed error occurs.
class ApiMethodNotAllowedException extends ApiException {
  const ApiMethodNotAllowedException(super.message, super.statusCode, super.reason,
      {super.errors});
}

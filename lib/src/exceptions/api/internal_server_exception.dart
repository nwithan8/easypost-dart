import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 500 Internal Server Error error occurs.
class ApiInternalServerException extends ApiException {
  const ApiInternalServerException(super.message, super.statusCode, super.reason,
      {super.errors});
}

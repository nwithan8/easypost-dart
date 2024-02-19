import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 400 Bad Request error occurs.
class BadRequestException extends ApiException {
  const BadRequestException(super.message, super.statusCode, super.reason,
      {super.errors});
}

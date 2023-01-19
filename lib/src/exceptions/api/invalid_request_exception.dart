import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 422 Payment Required error occurs.
class ApiInvalidRequestException extends ApiException {
  const ApiInvalidRequestException(
      super.message, super.statusCode, super.reason,
      {super.errors});
}

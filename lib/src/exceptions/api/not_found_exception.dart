import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 404 Not Found error occurs.
class ApiNotFoundException extends ApiException {
  const ApiNotFoundException(super.message, super.statusCode, super.reason,
      {super.errors});
}

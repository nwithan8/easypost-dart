import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 402 Method Not Allowed error occurs.
class ApiPaymentException extends ApiException {
  const ApiPaymentException(super.message, super.statusCode, super.reason,
      {super.errors});
}

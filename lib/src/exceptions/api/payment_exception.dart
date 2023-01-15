import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiPaymentException extends ApiException {
  const ApiPaymentException(super.message, super.statusCode, super.reason,
      {super.errors});
}

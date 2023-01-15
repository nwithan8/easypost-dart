import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException(super.message, super.statusCode, super.reason,
      {super.errors});
}

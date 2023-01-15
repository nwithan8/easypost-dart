import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiServiceUnavailableException extends ApiException {
  const ApiServiceUnavailableException(super.message, super.statusCode, super.reason,
      {super.errors});
}

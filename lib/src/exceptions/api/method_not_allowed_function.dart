import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiMethodNotAllowedException extends ApiException {
  const ApiMethodNotAllowedException(super.message, super.statusCode, super.reason,
      {super.errors});
}

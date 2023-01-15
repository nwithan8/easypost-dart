import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiInvalidRequestException extends ApiException {
  const ApiInvalidRequestException(super.message, super.statusCode, super.reason,
      {super.errors});
}

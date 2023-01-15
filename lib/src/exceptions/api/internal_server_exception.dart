import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiIntenalServerException extends ApiException {
  const ApiIntenalServerException(super.message, super.statusCode, super.reason,
      {super.errors});
}

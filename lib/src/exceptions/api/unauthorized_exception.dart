import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiUnauthorizedException extends ApiException {
  const ApiUnauthorizedException(super.message, super.statusCode, super.reason,
      {super.errors});
}

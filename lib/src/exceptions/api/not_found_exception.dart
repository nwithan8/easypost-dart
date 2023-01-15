import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiNotFoundException extends ApiException {
  const ApiNotFoundException(super.message, super.statusCode, super.reason,
      {super.errors});
}

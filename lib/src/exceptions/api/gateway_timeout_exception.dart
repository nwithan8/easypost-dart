import 'package:easypost/src/exceptions/api/api_exception.dart';

class ApiGatewayTimeoutException extends ApiException {
  const ApiGatewayTimeoutException(super.message, super.statusCode, super.reason,
      {super.errors});
}

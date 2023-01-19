import 'package:easypost/src/exceptions/api/api_exception.dart';

/// An exception that is thrown when a 504 Gateway Timeout error occurs.
class ApiGatewayTimeoutException extends ApiException {
  const ApiGatewayTimeoutException(
      super.message, super.statusCode, super.reason,
      {super.errors});
}

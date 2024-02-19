import 'package:easypost/src/base/exception.dart';
import 'package:easypost/src/constants.dart';

/// An exception that is thrown when a parameter is missing.
class MissingParameterException extends EasyPostException {
  const MissingParameterException(super.message);

  static MissingParameterException generate(String parameterName) {
    final message = ErrorMessages.format(
        ErrorMessages.missingRequiredParameter, [parameterName]);
    return MissingParameterException(message);
  }
}

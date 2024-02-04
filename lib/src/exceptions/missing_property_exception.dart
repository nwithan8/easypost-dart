import 'package:easypost/src/base/exception.dart';
import 'package:easypost/src/constants.dart';

/// An exception that is thrown when a property is missing.
class MissingPropertyException extends EasyPostException {
  const MissingPropertyException(super.message);

  static MissingPropertyException generate(String objectName, String propertyName) {
    final message = ErrorMessages.format(ErrorMessages.missingProperty, [objectName, propertyName]);
    return MissingPropertyException(message);
  }
}

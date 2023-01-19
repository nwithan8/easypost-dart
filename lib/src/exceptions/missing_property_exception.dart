import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when a property is missing.
class MissingPropertyException extends EasyPostException {
  const MissingPropertyException(super.message);
}

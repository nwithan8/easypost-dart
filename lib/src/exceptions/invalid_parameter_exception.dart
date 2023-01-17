import '../base/exception.dart';

/// An exception that is thrown when a parameter is invalid.
class InvalidParameterException extends EasyPostException {
  const InvalidParameterException(super.message);
}

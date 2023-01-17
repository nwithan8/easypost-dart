import '../base/exception.dart';

/// An exception that is thrown when an object is invalid.
class InvalidObjectException extends EasyPostException {
  const InvalidObjectException(super.message);
}

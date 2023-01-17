import '../base/exception.dart';

/// An exception that is thrown when a parameter is missing.
class MissingParameterException extends EasyPostException {
  const MissingParameterException(super.message);
}

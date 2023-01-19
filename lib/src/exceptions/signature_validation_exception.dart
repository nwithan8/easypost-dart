import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when a signature is invalid.
class SignatureValidationException extends EasyPostException {
  const SignatureValidationException(super.message);
}

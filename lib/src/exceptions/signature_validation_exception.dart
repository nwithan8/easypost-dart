import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when a signature validation fails.
class SignatureValidationException extends EasyPostException {
  const SignatureValidationException(super.message);
}

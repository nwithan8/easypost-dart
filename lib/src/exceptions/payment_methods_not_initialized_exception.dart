import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when payment methods are not initialized.
class PaymentMethodsNotInitializedException extends EasyPostException {
  const PaymentMethodsNotInitializedException(super.message);
}

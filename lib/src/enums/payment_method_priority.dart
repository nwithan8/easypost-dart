import 'package:easypost/src/internal/enums.dart';

/// The available payment method priorities.
class PaymentMethodPriority extends SerializableEnum {
  /// The primary payment method.
  static PaymentMethodPriority primary = PaymentMethodPriority(1, 'primary');

  /// The secondary payment method.
  static PaymentMethodPriority secondary =
      PaymentMethodPriority(2, 'secondary');

  PaymentMethodPriority(super.id, super.jsonValue);

  /// Get the [PaymentMethodPriority] from a [String].
  static PaymentMethodPriority? fromString(String? value) {
    switch (value) {
      case 'primary':
        return primary;
      case 'secondary':
        return secondary;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentMethodPriority].
  static String? asString(PaymentMethodPriority? paymentMethodPriority) =>
      paymentMethodPriority?.toString();
}

import 'package:easypost/src/internal/enums.dart';

/// The available payment log statuses.
class PaymentLogStatus extends SerializableEnum {
  /// Payment log status for pending.
  static PaymentLogStatus pending = PaymentLogStatus(1, 'pending');

  /// Payment log status for complete.
  static PaymentLogStatus complete = PaymentLogStatus(2, 'complete');

  /// Payment log status for failed.
  static PaymentLogStatus failed = PaymentLogStatus(3, 'failed');

  /// Payment log status for creditable.
  static PaymentLogStatus creditable = PaymentLogStatus(4, 'creditable');

  PaymentLogStatus(super.id, super.jsonValue);

  /// Get the [PaymentLogStatus] from a [String].
  static PaymentLogStatus? fromString(String? value) {
    switch (value) {
      case 'pending':
        return pending;
      case 'complete':
        return complete;
      case 'failed':
        return failed;
      case 'creditable':
        return creditable;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentLogStatus].
  static String? asString(PaymentLogStatus? paymentLogStatus) => paymentLogStatus.toString();
}

import 'package:easypost/src/internal/enums.dart';

/// The available payment log target types.
class PaymentLogTargetType extends SerializableEnum {
  /// Payment log target type for website.
  static PaymentLogTargetType website = PaymentLogTargetType(1, 'easypost_net');

  /// Payment log target type for user.
  static PaymentLogTargetType user = PaymentLogTargetType(2, 'user');

  /// Payment log target type for carrier account.
  static PaymentLogTargetType carrierAccount = PaymentLogTargetType(3, 'carrier_account');

  /// Payment log target type for manual credit.
  static PaymentLogTargetType manualCredit = PaymentLogTargetType(4, 'manual_credit');

  /// Payment log target type for bank account.
  static PaymentLogTargetType bankAccount = PaymentLogTargetType(5, 'bank_account');

  /// Payment log target type for ACH credit source.
  static PaymentLogTargetType achCreditSource = PaymentLogTargetType(6, 'ach_credit_source');

  /// Payment log target type for credit card.
  static PaymentLogTargetType creditCard = PaymentLogTargetType(7, 'credit_card');

  PaymentLogTargetType(super.id, super.jsonValue);

  /// Get the [PaymentLogTargetType] from a [String].
  static PaymentLogTargetType? fromString(String? value) {
    switch (value) {
      case 'easypost_net':
        return website;
      case 'user':
        return user;
      case 'carrier_account':
        return carrierAccount;
      case 'manual_credit':
        return manualCredit;
      case 'bank_account':
        return bankAccount;
      case 'ach_credit_source':
        return achCreditSource;
      case 'credit_card':
        return creditCard;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentLogTargetType].
  static String? asString(PaymentLogTargetType? paymentLogTargetType) => paymentLogTargetType.toString();
}

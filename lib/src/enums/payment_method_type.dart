import 'package:easypost/src/internal/enums.dart';

/// The available payment method priorities.
class PaymentMethodType extends SerializableEnum {
  /// A bank account.
  static PaymentMethodType bank = PaymentMethodType(1, 'bank');

  /// A credit card.
  static PaymentMethodType card = PaymentMethodType(2, 'card');

  PaymentMethodType(super.id, super.jsonValue);

  String? get endpoint {
    if (this.matches(PaymentMethodType.bank)) {
      return 'bank_accounts';
    } else if (this.matches(PaymentMethodType.card)) {
      return 'credit_cards';
    } else {
      return null;
    }
  }

  /// Get the [PaymentMethodType] from a [String].
  static PaymentMethodType? fromString(String? value) {
    switch (value) {
      case 'bank':
        return bank;
      case 'card':
        return card;
      default:
        return null;
    }
  }

  static PaymentMethodType? fromPrefix(String value) {
    if (value.startsWith('bank_')) {
      return bank;
    } else if (value.startsWith('card_')) {
      return card;
    } else {
      return null;
    }
  }

  /// Get the [String] representation of a [PaymentMethodType].
  static String? asString(PaymentMethodType? paymentMethodType) => paymentMethodType.toString();
}

enum PaymentMethodType {
  bank,
  card,
}

extension PaymentMethodTypeExtension on PaymentMethodType {
  String get endpoint {
    switch (this) {
      case PaymentMethodType.bank:
        return 'bank_accounts';
      case PaymentMethodType.card:
        return 'credit_cards';
    }
  }
}

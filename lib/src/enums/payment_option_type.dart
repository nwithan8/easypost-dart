import 'package:easypost/src/internal/enums.dart';

/// The available payment option types.
class PaymentOptionType extends SerializableEnum {
  /// The sender is the payer.
  static PaymentOptionType sender = PaymentOptionType(1, 'SENDER');

  /// The recipient is the payer.
  static PaymentOptionType recipient = PaymentOptionType(2, 'RECEIVER');

  /// A third party is the payer.
  static PaymentOptionType thirdParty = PaymentOptionType(3, 'THIRD_PARTY');

  /// The payment is collected.
  static PaymentOptionType collect = PaymentOptionType(4, 'COLLECT');

  PaymentOptionType(super.id, super.jsonValue);

  /// Get the [PaymentOptionType] from a [String].
  static PaymentOptionType? fromString(String? value) {
    switch (value) {
      case 'SENDER':
        return sender;
      case 'RECEIVER':
        return recipient;
      case 'THIRD_PARTY':
        return thirdParty;
      case 'COLLECT':
        return collect;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentOptionType].
  static String? asString(PaymentOptionType? paymentOptionType) =>
      paymentOptionType?.toString();
}

String? paymentOptionTypeToJson(PaymentOptionType? paymentOptionType) =>
    PaymentOptionType.asString(paymentOptionType);

PaymentOptionType? paymentOptionTypeFromJson(String? value) =>
    PaymentOptionType.fromString(value);

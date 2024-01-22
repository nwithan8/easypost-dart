import 'package:easypost/src/internal/enums.dart';

/// The available non-delivery options.
class NonDeliveryOption extends SerializableEnum {
  /// Return the shipment to the sender.
  static NonDeliveryOption returnToSender = NonDeliveryOption(1, 'return');

  /// Abandon the shipment.
  static NonDeliveryOption abandon = NonDeliveryOption(2, 'abandon');

  NonDeliveryOption(super.id, super.jsonValue);

  /// Get the [NonDeliveryOption] from a [String].
  static NonDeliveryOption? fromString(String? value) {
    switch (value) {
      case 'return':
        return returnToSender;
      case 'abandon':
        return abandon;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [NonDeliveryOption].
  static String? asString(NonDeliveryOption? nonDeliveryOption) =>
      nonDeliveryOption.toString();
}

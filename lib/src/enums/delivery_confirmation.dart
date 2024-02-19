import 'package:easypost/src/internal/enums.dart';

/// The available delivery confirmation types.
class DeliveryConfirmation extends SerializableEnum {
  /// Signature required
  static DeliveryConfirmation signatureRequired =
      DeliveryConfirmation(0, 'SIGNATURE');

  /// No signature required
  static DeliveryConfirmation noSignatureRequired =
      DeliveryConfirmation(1, 'NO_SIGNATURE');

  /// Adult signature required (USPS)
  static DeliveryConfirmation uspsAdultSignature =
      DeliveryConfirmation(2, 'ADULT_SIGNATURE');

  /// Indirect signature (FedEx)
  static DeliveryConfirmation fedexIndirectSignature =
      DeliveryConfirmation(1, 'INDIRECT_SIGNATURE');

  /// Do not hide package (Canada Post)
  static DeliveryConfirmation canadaPostDoNotSafeDrop =
      DeliveryConfirmation(4, 'DO_NOT_SAFE_DROP');

  /// Standard signature (GS0)
  static DeliveryConfirmation gs0StandardSignature =
      DeliveryConfirmation(5, 'STANDARD_SIGNATURE');

  DeliveryConfirmation(super.id, super.jsonValue);

  /// Get the [DeliveryConfirmation] from a [String].
  static DeliveryConfirmation? fromString(String? value) {
    switch (value) {
      case 'SIGNATURE':
        return DeliveryConfirmation.signatureRequired;
      case 'NO_SIGNATURE':
        return DeliveryConfirmation.noSignatureRequired;
      case 'ADULT_SIGNATURE':
        return DeliveryConfirmation.uspsAdultSignature;
      case 'INDIRECT_SIGNATURE':
        return DeliveryConfirmation.fedexIndirectSignature;
      case 'DO_NOT_SAFE_DROP':
        return DeliveryConfirmation.canadaPostDoNotSafeDrop;
      case 'STANDARD_SIGNATURE':
        return DeliveryConfirmation.gs0StandardSignature;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [DeliveryConfirmation].
  static String? asString(DeliveryConfirmation? deliveryConfirmation) =>
      deliveryConfirmation?.toString();
}

String? deliveryConfirmationToJson(
        DeliveryConfirmation? deliveryConfirmation) =>
    DeliveryConfirmation.asString(deliveryConfirmation);

DeliveryConfirmation? deliveryConfirmationFromJson(String? value) =>
    DeliveryConfirmation.fromString(value);

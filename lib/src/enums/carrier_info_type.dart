import 'package:easypost/src/internal/enums.dart';

/// The available types of information to retrieve about a carrier.
class CarrierInfoType extends SerializableEnum {
  /// Get information about the carrier's service levels.
  static CarrierInfoType serviceLevels = CarrierInfoType('service_levels');

  /// Get information about the carrier's predefined packages.
  static CarrierInfoType predefinedPackages =
      CarrierInfoType('predefined_packages');

  /// Get information about the carrier's shipment options.
  static CarrierInfoType shipmentOptions = CarrierInfoType('shipment_options');

  /// Get information about the carrier's supported features.
  static CarrierInfoType supportedFeatures =
      CarrierInfoType('supported_features');

  CarrierInfoType(super.jsonValue);

  /// Get the [CarrierInfoType] from a [String].
  static CarrierInfoType? fromString(String? value) {
    switch (value) {
      case 'service_levels':
        return serviceLevels;
      case 'predefined_packages':
        return predefinedPackages;
      case 'shipment_options':
        return shipmentOptions;
      case 'supported_features':
        return supportedFeatures;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [CarrierInfoType].
  static String? asString(CarrierInfoType? carrierInfoType) =>
      carrierInfoType.toString();
}

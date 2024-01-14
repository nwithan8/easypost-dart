import 'package:easypost/src/internal/enums.dart';

/// The available types of customs restrictions.
class CustomsRestrictionType extends SerializableEnum {
  /// No restrictions.
  static CustomsRestrictionType none = CustomsRestrictionType('none');

  /// Quarantine restrictions.
  static CustomsRestrictionType quarantine =
      CustomsRestrictionType('quarantine');

  /// Sanitary and phytosanitary inspection restrictions.
  static CustomsRestrictionType sanitaryAndPhytosanitary =
      CustomsRestrictionType('sanitary_phytosanitary_inspection');

  /// Other restrictions.
  static CustomsRestrictionType other = CustomsRestrictionType('other');

  CustomsRestrictionType(super.jsonValue);

  /// Get the [CustomsRestrictionType] from a [String].
  static CustomsRestrictionType? fromString(String? value) {
    switch (value) {
      case 'none':
        return none;
      case 'quarantine':
        return quarantine;
      case 'sanitary_phytosanitary_inspection':
        return sanitaryAndPhytosanitary;
      case 'other':
        return other;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [CustomsRestrictionType].
  static String? asString(CustomsRestrictionType? customsRestrictionType) =>
      customsRestrictionType.toString();
}

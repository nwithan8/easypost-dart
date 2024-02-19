import 'package:easypost/src/internal/enums.dart';

/// The available types of customs restrictions.
class CustomsRestrictionType extends SerializableEnum {
  /// No restrictions.
  static CustomsRestrictionType none = CustomsRestrictionType(1, 'none');

  /// Quarantine restrictions.
  static CustomsRestrictionType quarantine =
      CustomsRestrictionType(2, 'quarantine');

  /// Sanitary and phytosanitary inspection restrictions.
  static CustomsRestrictionType sanitaryAndPhytosanitary =
      CustomsRestrictionType(3, 'sanitary_phytosanitary_inspection');

  /// Other restrictions.
  static CustomsRestrictionType other = CustomsRestrictionType(4, 'other');

  CustomsRestrictionType(super.id, super.jsonValue);

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
      customsRestrictionType?.toString();
}

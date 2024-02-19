import 'package:easypost/src/internal/enums.dart';

/// The available dangerous goods (HAZMAT) types.
class HazmatType extends SerializableEnum {
  /// Primary contained
  static HazmatType primaryContained = HazmatType(1, 'PRIMARY_CONTAINED');

  /// Primary packed
  static HazmatType primaryPacked = HazmatType(2, 'PRIMARY_PACKED');

  /// Primary
  static HazmatType primary = HazmatType(3, 'PRIMARY');

  /// Secondary contained
  static HazmatType secondaryContained = HazmatType(4, 'SECONDARY_CONTAINED');

  /// Secondary packed
  static HazmatType secondaryPacked = HazmatType(5, 'SECONDARY_PACKED');

  /// Secondary
  static HazmatType secondary = HazmatType(6, 'SECONDARY');

  /// ORM-D
  static HazmatType ormD = HazmatType(7, 'ORMD');

  /// Limited quantity
  static HazmatType limitedQuantity = HazmatType(8, 'LIMITED_QUANTITY');

  /// Lithium
  static HazmatType lithium = HazmatType(9, 'LITHIUM');

  HazmatType(super.id, super.jsonValue);

  /// Get the [HazmatType] from a [String].
  static HazmatType? fromString(String? value) {
    switch (value) {
      case 'PRIMARY_CONTAINED':
        return primaryContained;
      case 'PRIMARY_PACKED':
        return primaryPacked;
      case 'PRIMARY':
        return primary;
      case 'SECONDARY_CONTAINED':
        return secondaryContained;
      case 'SECONDARY_PACKED':
        return secondaryPacked;
      case 'SECONDARY':
        return secondary;
      case 'ORMD':
        return ormD;
      case 'LIMITED_QUANTITY':
        return limitedQuantity;
      case 'LITHIUM':
        return lithium;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [HazmatType].
  static String? asString(HazmatType? hazmatType) => hazmatType?.toString();
}

String? hazmatTypeToJson(HazmatType? hazmatType) =>
    HazmatType.asString(hazmatType);

HazmatType? hazmatTypeFromJson(String? value) => HazmatType.fromString(value);

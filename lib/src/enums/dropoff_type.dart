import 'package:easypost/src/internal/enums.dart';

/// The available drop-off types.
class DropOffType extends SerializableEnum {
  /// Regular pickup
  static DropOffType regularPickup = DropOffType(1, 'REGULAR_PICKUP');

  /// Scheduled pickup
  static DropOffType scheduledPickup = DropOffType(2, 'SCHEDULED_PICKUP');

  /// Retail location
  static DropOffType retailLocation = DropOffType(3, 'RETAIL_LOCATION');

  /// Station
  static DropOffType station = DropOffType(4, 'STATION');

  /// Drop box
  static DropOffType dropBox = DropOffType(5, 'DROP_BOX');

  DropOffType(super.id, super.jsonValue);

  /// Get the [DropOffType] from a [String].
  static DropOffType? fromString(String? value) {
    switch (value) {
      case 'REGULAR_PICKUP':
        return regularPickup;
      case 'SCHEDULED_PICKUP':
        return scheduledPickup;
      case 'RETAIL_LOCATION':
        return retailLocation;
      case 'STATION':
        return station;
      case 'DROP_BOX':
        return dropBox;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [DropOffType].
  static String? asString(DropOffType? dropOffType) => dropOffType?.toString();
}

String? dropOffTypeToJson(DropOffType? dropOffType) =>
    DropOffType.asString(dropOffType);

DropOffType? dropOffTypeFromJson(String? value) =>
    DropOffType.fromString(value);

import 'package:easypost/src/internal/enums.dart';

/// The available smart rate accuracy options.
class SmartRateAccuracy extends SerializableEnum {
  /// The 50th percentile.
  static SmartRateAccuracy percentile50 = SmartRateAccuracy(1, 'percentile_50');

  /// The 75th percentile.
  static SmartRateAccuracy percentile75 = SmartRateAccuracy(2, 'percentile_75');

  /// The 85th percentile.
  static SmartRateAccuracy percentile85 = SmartRateAccuracy(3, 'percentile_85');

  /// The 90th percentile.
  static SmartRateAccuracy percentile90 = SmartRateAccuracy(4, 'percentile_90');

  /// The 95th percentile.
  static SmartRateAccuracy percentile95 = SmartRateAccuracy(5, 'percentile_95');

  /// The 97th percentile.
  static SmartRateAccuracy percentile97 = SmartRateAccuracy(6, 'percentile_97');

  /// The 99th percentile.
  static SmartRateAccuracy percentile99 = SmartRateAccuracy(7, 'percentile_99');

  SmartRateAccuracy(super.id, super.jsonValue);

  /// Get the [SmartRateAccuracy] from a [String].
  static SmartRateAccuracy? fromString(String? value) {
    if (value == null) return null;
    value = value.trim().toLowerCase();
    switch (value) {
      case 'percentile_50':
      case '50th':
      case '50':
        return percentile50;
      case 'percentile_75':
      case '75th':
      case '75':
        return percentile75;
      case 'percentile_85':
      case '85th':
      case '85':
        return percentile85;
      case 'percentile_90':
      case '90th':
      case '90':
        return percentile90;
      case 'percentile_95':
      case '95th':
      case '95':
        return percentile95;
      case 'percentile_97':
      case '97th':
      case '97':
        return percentile97;
      case 'percentile_99':
      case '99th':
      case '99':
        return percentile99;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [SmartRateAccuracy].
  static String? asString(SmartRateAccuracy? smartRateAccuracy) =>
      smartRateAccuracy?.toString();
}

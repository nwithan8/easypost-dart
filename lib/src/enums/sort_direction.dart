import 'package:easypost/src/internal/enums.dart';

/// The available sort directions.
class SortDirection extends SerializableEnum {
  /// Sort in ascending order.
  static SortDirection ascending = SortDirection(1, 'asc');

  /// Sort in descending order.
  static SortDirection descending = SortDirection(2, 'desc');

  SortDirection(super.id, super.jsonValue);

  /// Get the [SortDirection] from a [String].
  static SortDirection? fromString(String? value) {
    if (value == null) return null;
    value = value.trim().toLowerCase();
    switch (value) {
      case 'asc':
      case 'ascending':
      case 'ascend':
      case 'up':
        return SortDirection.ascending;
      case 'desc':
      case 'descending':
      case 'descend':
      case 'down':
        return SortDirection.descending;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [SortDirection].
  static String? asString(SortDirection? sortDirection) => sortDirection.toString();
}

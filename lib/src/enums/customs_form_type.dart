import 'package:easypost/src/internal/enums.dart';

/// The available types of customs forms.
class CustomsFormType extends SerializableEnum {
  /// EEL form.
  static CustomsFormType eel = CustomsFormType(1, 'EEL');

  /// PFC form.
  static CustomsFormType pfc = CustomsFormType(2, 'PFC');

  CustomsFormType(super.id, super.jsonValue);

  /// Get the [CustomsFormType] from a [String].
  static CustomsFormType? fromString(String? value) {
    switch (value) {
      case 'EEL':
        return eel;
      case 'PFC':
        return pfc;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [CustomsFormType].
  static String? asString(CustomsFormType? customsFormType) =>
      customsFormType?.toString();
}

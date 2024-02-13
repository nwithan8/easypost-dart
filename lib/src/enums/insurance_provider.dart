import 'package:easypost/src/internal/enums.dart';

/// The available insurance providers.
class InsuranceProvider extends SerializableEnum {
  /// The EasyPost insurance provider.
  static InsuranceProvider easypost = InsuranceProvider(1, 'easypost');

  /// The PIP insurance provider.
  static InsuranceProvider pip = InsuranceProvider(2, 'pip');

  /// The Shipsurance insurance provider.
  static InsuranceProvider shipsurance = InsuranceProvider(3, 'shipsurance');

  InsuranceProvider(super.id, super.jsonValue);

  /// Get the [InsuranceProvider] from a [String].
  static InsuranceProvider? fromString(String? value) {
    switch (value) {
      case 'easypost':
        return easypost;
      case 'pip':
        return pip;
      case 'shipsurance':
        return shipsurance;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [InsuranceProvider].
  static String? asString(InsuranceProvider? insuranceProvider) =>
      insuranceProvider?.toString();
}

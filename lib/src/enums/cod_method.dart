import 'package:easypost/src/internal/enums.dart';

/// The available charge-on-delivery (COD) methods.
class CodMethod extends SerializableEnum {
  /// Cash
  static CodMethod cash = CodMethod(0, 'CASH');

  /// Check
  static CodMethod check = CodMethod(1, 'CHECK');

  /// Money order
  static CodMethod moneyOrder = CodMethod(2, 'MONEY_ORDER');

  CodMethod(super.id, super.jsonValue);

  /// Get the [CodMethod] from a [String].
  static CodMethod? fromString(String? value) {
    switch (value) {
      case 'CASH':
        return CodMethod.cash;
      case 'CHECK':
        return CodMethod.check;
      case 'MONEY_ORDER':
        return CodMethod.moneyOrder;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [CodMethod].
  static String? asString(CodMethod? codMethod) => codMethod?.toString();
}

String? codMethodToJson(CodMethod? codMethod) => CodMethod.asString(codMethod);

CodMethod? codMethodFromJson(String? value) => CodMethod.fromString(value);

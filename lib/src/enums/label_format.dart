import 'package:easypost/src/internal/enums.dart';

/// The available label formats.
class LabelFormat extends SerializableEnum {
  /// The PDF label format.
  static LabelFormat pdf = LabelFormat(1, 'pdf');

  /// The ZPL label format.
  static LabelFormat zpl = LabelFormat(2, 'zpl');

  /// The EPL2 label format.
  static LabelFormat epl2 = LabelFormat(3, 'epl2');

  /// The PNG label format.
  static LabelFormat png = LabelFormat(4, 'png');

  LabelFormat(super.id, super.jsonValue);

  /// Get the [LabelFormat] from a [String].
  static LabelFormat? fromString(String? value) {
    switch (value) {
      case 'pdf':
        return pdf;
      case 'zpl':
        return zpl;
      case 'epl2':
        return epl2;
      case 'png':
        return png;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [LabelFormat].
  static String? asString(LabelFormat? labelFormat) => labelFormat?.toString();
}

String? labelFormatToJson(LabelFormat? labelFormat) =>
    LabelFormat.asString(labelFormat);

LabelFormat? labelFormatFromJson(String? value) => LabelFormat.fromString(value);

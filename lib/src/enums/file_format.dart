import 'package:easypost/src/internal/enums.dart';

/// The available file formats.
class FileFormat extends SerializableEnum {
  /// The PDF file format.
  static FileFormat pdf = FileFormat(1, 'PDF');

  /// The ZPL file format.
  static FileFormat zpl = FileFormat(2, 'ZPL');

  /// The EPL2 file format.
  static FileFormat epl2 = FileFormat(3, 'EPL2');

  FileFormat(super.id, super.jsonValue);

  /// Get the [FileFormat] from a [String].
  static FileFormat? fromString(String? value) {
    switch (value) {
      case 'PDF':
        return pdf;
      case 'ZPL':
        return zpl;
      case 'EPL2':
        return epl2;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [FileFormat].
  static String? asString(FileFormat? fileFormat) => fileFormat?.toString();
}

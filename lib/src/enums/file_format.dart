import 'package:easypost/src/internal/enums.dart';

/// The available file formats.
class FileFormat extends SerializableEnum {
  /// The PDF file format.
  static FileFormat pdf = FileFormat('pdf');

  /// The ZPL file format.
  static FileFormat zpl = FileFormat('zpl');

  /// The EPL2 file format.
  static FileFormat epl2 = FileFormat('epl2');

  FileFormat(super.jsonValue);

  /// Get the [FileFormat] from a [String].
  static FileFormat? fromString(String value) {
    switch (value) {
      case 'pdf':
        return pdf;
      case 'zpl':
        return zpl;
      case 'epl2':
        return epl2;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [FileFormat].
  static String? asString(FileFormat? fileFormat) => fileFormat.toString();
}
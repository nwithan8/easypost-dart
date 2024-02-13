import 'package:easypost/src/internal/enums.dart';

/// The available Incoterm types.
class IncotermType extends SerializableEnum {
  /// The EXW Incoterm type.
  static IncotermType exw = IncotermType(1, 'EXW');

  /// The FCA Incoterm type.
  static IncotermType fca = IncotermType(2, 'FCA');

  /// The CPT Incoterm type.
  static IncotermType cpt = IncotermType(3, 'CPT');

  /// The CIP Incoterm type.
  static IncotermType cip = IncotermType(4, 'CIP');

  /// The DAT Incoterm type.
  static IncotermType dat = IncotermType(5, 'DAT');

  /// The DAP Incoterm type.
  static IncotermType dap = IncotermType(6, 'DAP');

  /// The DDP Incoterm type.
  static IncotermType ddp = IncotermType(7, 'DDP');

  /// The FAS Incoterm type.
  static IncotermType fas = IncotermType(8, 'FAS');

  /// The FOB Incoterm type.
  static IncotermType fob = IncotermType(9, 'FOB');

  /// The CFR Incoterm type.
  static IncotermType cfr = IncotermType(10, 'CFR');

  /// The CIF Incoterm type.
  static IncotermType cif = IncotermType(11, 'CIF');

  IncotermType(super.id, super.jsonValue);

  /// Get the [IncotermType] from a [String].
  static IncotermType? fromString(String? value) {
    switch (value) {
      case 'EXW':
        return exw;
      case 'FCA':
        return fca;
      case 'CPT':
        return cpt;
      case 'CIP':
        return cip;
      case 'DAT':
        return dat;
      case 'DAP':
        return dap;
      case 'DDP':
        return ddp;
      case 'FAS':
        return fas;
      case 'FOB':
        return fob;
      case 'CFR':
        return cfr;
      case 'CIF':
        return cif;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [IncotermType].
  static String? asString(IncotermType? incotermType) =>
      incotermType?.toString();
}

String? incotermTypeToJson(IncotermType? incotermType) =>
    IncotermType.asString(incotermType);

IncotermType? incotermTypeFromJson(String? value) =>
    IncotermType.fromString(value);

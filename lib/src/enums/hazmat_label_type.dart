import 'package:easypost/src/internal/enums.dart';

/// The available dangerous goods (HAZMAT) label types.
class HazmatLabelType extends SerializableEnum {
  static HazmatLabelType explosive1 = HazmatLabelType(1, 'EXPLOSIVE_1');
  static HazmatLabelType explosive1_1 = HazmatLabelType(2, 'EXPLOSIVE_1_1');
  static HazmatLabelType explosive1_1a = HazmatLabelType(3, 'EXPLOSIVE_1_1A');
  static HazmatLabelType explosive1_1b = HazmatLabelType(4, 'EXPLOSIVE_1_1B');
  static HazmatLabelType explosive1_1c = HazmatLabelType(5, 'EXPLOSIVE_1_1C');
  static HazmatLabelType explosive1_1d = HazmatLabelType(6, 'EXPLOSIVE_1_1D');
  static HazmatLabelType explosive1_1e = HazmatLabelType(7, 'EXPLOSIVE_1_1E');
  static HazmatLabelType explosive1_1f = HazmatLabelType(8, 'EXPLOSIVE_1_1F');
  static HazmatLabelType explosive1_1g = HazmatLabelType(9, 'EXPLOSIVE_1_1G');
  static HazmatLabelType explosive1_1j = HazmatLabelType(10, 'EXPLOSIVE_1_1J');
  static HazmatLabelType explosive1_1l = HazmatLabelType(11, 'EXPLOSIVE_1_1L');
  static HazmatLabelType explosive1_2 = HazmatLabelType(12, 'EXPLOSIVE_1_2');
  static HazmatLabelType explosive1_2b = HazmatLabelType(13, 'EXPLOSIVE_1_2B');
  static HazmatLabelType explosive1_2c = HazmatLabelType(14, 'EXPLOSIVE_1_2C');
  static HazmatLabelType explosive1_2d = HazmatLabelType(15, 'EXPLOSIVE_1_2D');
  static HazmatLabelType explosive1_2e = HazmatLabelType(16, 'EXPLOSIVE_1_2E');
  static HazmatLabelType explosive1_2f = HazmatLabelType(17, 'EXPLOSIVE_1_2F');
  static HazmatLabelType explosive1_2g = HazmatLabelType(18, 'EXPLOSIVE_1_2G');
  static HazmatLabelType explosive1_2h = HazmatLabelType(19, 'EXPLOSIVE_1_2H');
  static HazmatLabelType explosive1_2j = HazmatLabelType(20, 'EXPLOSIVE_1_2J');
  static HazmatLabelType explosive1_2k = HazmatLabelType(21, 'EXPLOSIVE_1_2K');
  static HazmatLabelType explosive1_2l = HazmatLabelType(22, 'EXPLOSIVE_1_2L');
  static HazmatLabelType explosive1_3 = HazmatLabelType(23, 'EXPLOSIVE_1_3');
  static HazmatLabelType explosive1_3c = HazmatLabelType(24, 'EXPLOSIVE_1_3C');
  static HazmatLabelType explosive1_3f = HazmatLabelType(25, 'EXPLOSIVE_1_3F');
  static HazmatLabelType explosive1_3g = HazmatLabelType(26, 'EXPLOSIVE_1_3G');
  static HazmatLabelType explosive1_3h = HazmatLabelType(27, 'EXPLOSIVE_1_3H');
  static HazmatLabelType explosive1_3j = HazmatLabelType(28, 'EXPLOSIVE_1_3J');
  static HazmatLabelType explosive1_3k = HazmatLabelType(29, 'EXPLOSIVE_1_3K');
  static HazmatLabelType explosive1_3l = HazmatLabelType(30, 'EXPLOSIVE_1_3L');
  static HazmatLabelType explosive1_4 = HazmatLabelType(31, 'EXPLOSIVE_1_4');
  static HazmatLabelType explosive1_4b = HazmatLabelType(32, 'EXPLOSIVE_1_4B');
  static HazmatLabelType explosive1_4c = HazmatLabelType(33, 'EXPLOSIVE_1_4C');
  static HazmatLabelType explosive1_4d = HazmatLabelType(34, 'EXPLOSIVE_1_4D');
  static HazmatLabelType explosive1_4e = HazmatLabelType(35, 'EXPLOSIVE_1_4E');
  static HazmatLabelType explosive1_4f = HazmatLabelType(36, 'EXPLOSIVE_1_4F');
  static HazmatLabelType explosive1_4g = HazmatLabelType(37, 'EXPLOSIVE_1_4G');
  static HazmatLabelType explosive1_4s = HazmatLabelType(38, 'EXPLOSIVE_1_4S');
  static HazmatLabelType explosive1_5 = HazmatLabelType(39, 'EXPLOSIVE_1_5');
  static HazmatLabelType explosive1_5d = HazmatLabelType(40, 'EXPLOSIVE_1_5D');
  static HazmatLabelType explosive1_6n = HazmatLabelType(41, 'EXPLOSIVE_1_6N');
  static HazmatLabelType flammable2 = HazmatLabelType(42, 'FLAMMABLE_2');
  static HazmatLabelType nonFlammable2 = HazmatLabelType(43, 'NONFLAMMABLE_2');
  static HazmatLabelType hazard2 = HazmatLabelType(44, 'HAZARD_2');
  static HazmatLabelType toxic2 = HazmatLabelType(45, 'TOXIC_2');
  static HazmatLabelType flammable3 = HazmatLabelType(46, 'FLAMMABLE_3');
  static HazmatLabelType flammableLiquid3 = HazmatLabelType(47, 'FLAMMABLELIQUID_3');
  static HazmatLabelType combustible3 = HazmatLabelType(48, 'COMBUSTIBLE_3');
  static HazmatLabelType fuelOil3 = HazmatLabelType(49, 'FUELOIL_3');
  static HazmatLabelType gasoline3 = HazmatLabelType(50, 'GASOLINE_3');
  static HazmatLabelType flammableSolid4 = HazmatLabelType(51, 'FLAMMABLESOLID_4');
  static HazmatLabelType dangerWet4 = HazmatLabelType(52, 'DANGERWET_4');
  static HazmatLabelType spontaneousCombustible4 = HazmatLabelType(53, 'SPONTCOMBUSTIBLE_4');
  static HazmatLabelType oxidizer5_1 = HazmatLabelType(54, 'OXIDIZER_5_1');
  static HazmatLabelType organicPeroxide5_2 = HazmatLabelType(55, 'ORGANICPEROXIDE_5_2');
  static HazmatLabelType toxic6 = HazmatLabelType(56, 'TOXIC_6');
  static HazmatLabelType infectious6 = HazmatLabelType(57, 'INFECTIOUS_6');
  static HazmatLabelType poison6 = HazmatLabelType(58, 'POISON_6');
  static HazmatLabelType inhalationHazard6 = HazmatLabelType(59, 'INHALATIONHAZ_6');
  static HazmatLabelType radioactiveI_7 = HazmatLabelType(60, 'RADIOACTIVE_I_7');
  static HazmatLabelType radioactiveII_7 = HazmatLabelType(61, 'RADIOACTIVE_II_7');
  static HazmatLabelType radioactiveIII_7 = HazmatLabelType(62, 'RADIOACTIVE_III_7');
  static HazmatLabelType fissile7 = HazmatLabelType(63, 'FISSILE_7');
  static HazmatLabelType corrosive8 = HazmatLabelType(64, 'CORROSIVE_8');
  static HazmatLabelType miscellaneous9 = HazmatLabelType(65, 'MISCELLANEOUS_9');
  static HazmatLabelType lithiumBattery9 = HazmatLabelType(66, 'LITHIUMBATTERY_9');




  HazmatLabelType(super.id, super.jsonValue);

  /// Get the [HazmatLabelType] from a [String].
  static HazmatLabelType? fromString(String? value) {
    switch (value) {
      case 'EXPLOSIVE_1':
        return explosive1;
      case 'EXPLOSIVE_1_1':
        return explosive1_1;
      case 'EXPLOSIVE_1_1A':
        return explosive1_1a;
      case 'EXPLOSIVE_1_1B':
        return explosive1_1b;
      case 'EXPLOSIVE_1_1C':
        return explosive1_1c;
      case 'EXPLOSIVE_1_1D':
        return explosive1_1d;
      case 'EXPLOSIVE_1_1E':
        return explosive1_1e;
      case 'EXPLOSIVE_1_1F':
        return explosive1_1f;
      case 'EXPLOSIVE_1_1G':
        return explosive1_1g;
      case 'EXPLOSIVE_1_1J':
        return explosive1_1j;
      case 'EXPLOSIVE_1_1L':
        return explosive1_1l;
      case 'EXPLOSIVE_1_2':
        return explosive1_2;
      case 'EXPLOSIVE_1_2B':
        return explosive1_2b;
      case 'EXPLOSIVE_1_2C':
        return explosive1_2c;
      case 'EXPLOSIVE_1_2D':
        return explosive1_2d;
      case 'EXPLOSIVE_1_2E':
        return explosive1_2e;
      case 'EXPLOSIVE_1_2F':
        return explosive1_2f;
      case 'EXPLOSIVE_1_2G':
        return explosive1_2g;
      case 'EXPLOSIVE_1_2H':
        return explosive1_2h;
      case 'EXPLOSIVE_1_2J':
        return explosive1_2j;
      case 'EXPLOSIVE_1_2K':
        return explosive1_2k;
      case 'EXPLOSIVE_1_2L':
        return explosive1_2l;
      case 'EXPLOSIVE_1_3':
        return explosive1_3;
      case 'EXPLOSIVE_1_3C':
        return explosive1_3c;
      case 'EXPLOSIVE_1_3F':
        return explosive1_3f;
      case 'EXPLOSIVE_1_3G':
        return explosive1_3g;
      case 'EXPLOSIVE_1_3H':
        return explosive1_3h;
      case 'EXPLOSIVE_1_3J':
        return explosive1_3j;
      case 'EXPLOSIVE_1_3K':
        return explosive1_3k;
      case 'EXPLOSIVE_1_3L':
        return explosive1_3l;
      case 'EXPLOSIVE_1_4':
        return explosive1_4;
      case 'EXPLOSIVE_1_4B':
        return explosive1_4b;
      case 'EXPLOSIVE_1_4C':
        return explosive1_4c;
      case 'EXPLOSIVE_1_4D':
        return explosive1_4d;
      case 'EXPLOSIVE_1_4E':
        return explosive1_4e;
      case 'EXPLOSIVE_1_4F':
        return explosive1_4f;
      case 'EXPLOSIVE_1_4G':
        return explosive1_4g;
      case 'EXPLOSIVE_1_4S':
        return explosive1_4s;
      case 'EXPLOSIVE_1_5':
        return explosive1_5;
      case 'EXPLOSIVE_1_5D':
        return explosive1_5d;
      case 'EXPLOSIVE_1_6N':
        return explosive1_6n;
      case 'FLAMMABLE_2':
        return flammable2;
      case 'NONFLAMMABLE_2':
        return nonFlammable2;
      case 'HAZARD_2':
        return hazard2;
      case 'TOXIC_2':
        return toxic2;
      case 'FLAMMABLE_3':
        return flammable3;
      case 'FLAMMABLELIQUID_3':
        return flammableLiquid3;
      case 'COMBUSTIBLE_3':
        return combustible3;
      case 'FUELOIL_3':
        return fuelOil3;
      case 'GASOLINE_3':
        return gasoline3;
      case 'FLAMMABLESOLID_4':
        return flammableSolid4;
      case 'DANGERWET_4':
        return dangerWet4;
      case 'SPONTCOMBUSTIBLE_4':
        return spontaneousCombustible4;
      case 'OXIDIZER_5_1':
        return oxidizer5_1;
      case 'ORGANICPEROXIDE_5_2':
        return organicPeroxide5_2;
      case 'TOXIC_6':
        return toxic6;
      case 'INFECTIOUS_6':
        return infectious6;
      case 'POISON_6':
        return poison6;
      case 'INHALATIONHAZ_6':
        return inhalationHazard6;
      case 'RADIOACTIVE_I_7':
        return radioactiveI_7;
      case 'RADIOACTIVE_II_7':
        return radioactiveII_7;
      case 'RADIOACTIVE_III_7':
        return radioactiveIII_7;
      case 'FISSILE_7':
        return fissile7;
      case 'CORROSIVE_8':
        return corrosive8;
      case 'MISCELLANEOUS_9':
        return miscellaneous9;
      case 'LITHIUMBATTERY_9':
        return lithiumBattery9;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [HazmatLabelType].
  static String? asString(HazmatLabelType? hazmatType) => hazmatType?.toString();
}

String? hazmatLabelTypeToJson(HazmatLabelType? hazmatLabelType) =>
    HazmatLabelType.asString(hazmatLabelType);

HazmatLabelType? hazmatLabelTypeFromJson(String? value) => HazmatLabelType.fromString(value);

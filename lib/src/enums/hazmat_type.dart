import 'package:easypost/src/internal/enums.dart';

/// The available dangerous goods (HAZMAT) types.
class HazmatType extends SerializableEnum {
  /// Primary contained - Lithium metal (non-rechargeable)
  static HazmatType primaryContained = HazmatType(1, 'PRIMARY_CONTAINED');

  /// Primary packed - Lithium metal (non-rechargeable)
  static HazmatType primaryPacked = HazmatType(2, 'PRIMARY_PACKED');

  /// Primary - Lithium metal (non-rechargeable)
  static HazmatType primary = HazmatType(3, 'PRIMARY');

  /// Secondary contained - Lithium ion (rechargeable)
  static HazmatType secondaryContained = HazmatType(4, 'SECONDARY_CONTAINED');

  /// Secondary packed - Lithium ion (rechargeable)
  static HazmatType secondaryPacked = HazmatType(5, 'SECONDARY_PACKED');

  /// Secondary - Lithium ion (rechargeable)
  static HazmatType secondary = HazmatType(6, 'SECONDARY');

  /// Other Regulated Materials-Domestic
  static HazmatType ormD = HazmatType(7, 'ORMD');

  /// Limited quantity
  static HazmatType limitedQuantity = HazmatType(8, 'LIMITED_QUANTITY');

  /// Lithium
  static HazmatType lithium = HazmatType(9, 'LITHIUM');

  /// NIHM
  static HazmatType niHM = HazmatType(10, 'NIHM');

  /// PI965-II
  static HazmatType pi965II = HazmatType(11, 'PI965-II');

  /// PI966-II
  static HazmatType pi966II = HazmatType(12, 'PI966-II');

  /// PI967-II
  static HazmatType pi967II = HazmatType(13, 'PI967-II');

  /// PI969-II
  static HazmatType pi969II = HazmatType(14, 'PI969-II');

  /// PI970-II
  static HazmatType pi970II = HazmatType(15, 'PI970-II');

  /// Air-eligible ethanol
  static HazmatType airEligibleEthanol = HazmatType(16, 'AIR_ELIGIBLE_ETHANOL');

  /// Class 1 (toy propellant/safety fuse)
  static HazmatType class1 = HazmatType(17, 'CLASS_1');

  /// Class 3
  static HazmatType class3 = HazmatType(18, 'CLASS_3');

  /// Class 7 (radioactive material)
  static HazmatType class7 = HazmatType(19, 'CLASS_7');

  /// Class 8 (corrosive)
  static HazmatType class8 = HazmatType(20, 'CLASS_8_CORROSIVE');

  /// Class 8 (nonspillable wet battery)
  static HazmatType class8WetBattery = HazmatType(21, 'CLASS_8_WET_BATTERY');

  /// Class 9 (lithium battery marked - ground only)
  static HazmatType class9NewLithiumIndividual = HazmatType(22, 'CLASS_9_NEW_LITHIUM_INDIVIDUAL');

  /// Class 9 (lithium batteries, marked)
  static HazmatType class9NewLithiumDevice = HazmatType(23, 'CLASS_9_NEW_LITHIUM_DEVICE');

  /// Class 9 (used lithium - returns)
  static HazmatType class9UsedLithium = HazmatType(24, 'CLASS_9_USED_LITHIUM');

  /// Division 4.1 (mailable flammable solids and safety matches)
  static HazmatType division41 = HazmatType(25, 'DIVISION_4_1');

  /// Division 5.1 (oxidizers)
  static HazmatType division51 = HazmatType(26, 'DIVISION_5_1');

  /// Division 5.2 (organic peroxides)
  static HazmatType division52 = HazmatType(27, 'DIVISION_5_2');

  /// Division 6.1 (toxic materials with LD50 of 50mg/kg or less)
  static HazmatType division61 = HazmatType(28, 'DIVISION_6_1');

  /// Division 6.2
  static HazmatType division62 = HazmatType(29, 'DIVISION_6_2');

  /// Excepted quantity provision
  static HazmatType exceptedQuantityProvision = HazmatType(30, 'EXCEPTED_QUANTITY_PROVISION');

  /// Ground only
  static HazmatType groundOnly = HazmatType(31, 'GROUND_ONLY');

  /// ID8000 (consumer commodity)
  static HazmatType id8000 = HazmatType(32, 'ID8000');

  /// Lighters
  static HazmatType lighters = HazmatType(33, 'LIGHTERS');

  /// Small quantity provision
  static HazmatType smallQuantityProvision = HazmatType(34, 'SMALL_QUANTITY_PROVISION');

  /// HAZMAT APO FPO
  static HazmatType hazmatApoFpo = HazmatType(35, 'HAZMAT_APO_FPO');

  HazmatType(super.id, super.jsonValue);

  /// Get the [HazmatType] from a [String].
  static HazmatType? fromString(String? value) {
    switch (value) {
      case 'PRIMARY_CONTAINED':
        return primaryContained;
      case 'PRIMARY_PACKED':
        return primaryPacked;
      case 'PRIMARY':
        return primary;
      case 'SECONDARY_CONTAINED':
        return secondaryContained;
      case 'SECONDARY_PACKED':
        return secondaryPacked;
      case 'SECONDARY':
        return secondary;
      case 'ORMD':
        return ormD;
      case 'LIMITED_QUANTITY':
        return limitedQuantity;
      case 'LITHIUM':
        return lithium;
      case 'NIHM':
        return niHM;
      case 'PI965-II':
        return pi965II;
      case 'PI966-II':
        return pi966II;
      case 'PI967-II':
        return pi967II;
      case 'PI969-II':
        return pi969II;
      case 'PI970-II':
        return pi970II;
      case 'AIR_ELIGIBLE_ETHANOL':
        return airEligibleEthanol;
      case 'CLASS_1':
        return class1;
      case 'CLASS_3':
        return class3;
      case 'CLASS_7':
        return class7;
      case 'CLASS_8_CORROSIVE':
        return class8;
      case 'CLASS_8_WET_BATTERY':
        return class8WetBattery;
      case 'CLASS_9_NEW_LITHIUM_INDIVIDUAL':
        return class9NewLithiumIndividual;
      case 'CLASS_9_NEW_LITHIUM_DEVICE':
        return class9NewLithiumDevice;
      case 'CLASS_9_USED_LITHIUM':
        return class9UsedLithium;
      case 'DIVISION_4_1':
        return division41;
      case 'DIVISION_5_1':
        return division51;
      case 'DIVISION_5_2':
        return division52;
      case 'DIVISION_6_1':
        return division61;
      case 'DIVISION_6_2':
        return division62;
      case 'EXCEPTED_QUANTITY_PROVISION':
        return exceptedQuantityProvision;
      case 'GROUND_ONLY':
        return groundOnly;
      case 'ID8000':
        return id8000;
      case 'LIGHTERS':
        return lighters;
      case 'SMALL_QUANTITY_PROVISION':
        return smallQuantityProvision;
      case 'HAZMAT_APO_FPO':
        return hazmatApoFpo;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [HazmatType].
  static String? asString(HazmatType? hazmatType) => hazmatType?.toString();
}

String? hazmatTypeToJson(HazmatType? hazmatType) =>
    HazmatType.asString(hazmatType);

HazmatType? hazmatTypeFromJson(String? value) => HazmatType.fromString(value);

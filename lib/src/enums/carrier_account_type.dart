import 'package:easypost/src/internal/enums.dart';

/// The available carrier account types.
class CarrierAccountType extends SerializableEnum {
  static CarrierAccountType amazonMws =
      CarrierAccountType(1, 'AmazonMwsAccount');
  static CarrierAccountType apc = CarrierAccountType(2, 'ApcAccount');
  static CarrierAccountType asendia = CarrierAccountType(3, 'AsendiaAccount');
  static CarrierAccountType asendiaUsa =
      CarrierAccountType(4, 'AsendiaUsaAccount');
  static CarrierAccountType australiaPost =
      CarrierAccountType(5, 'AustraliaPostAccount');
  static CarrierAccountType axlehireV3 =
      CarrierAccountType(6, 'AxlehireV3Account');
  static CarrierAccountType betterTrucks =
      CarrierAccountType(7, 'BetterTrucksAccount');
  static CarrierAccountType bond = CarrierAccountType(8, 'BondAccount');
  static CarrierAccountType canadaPost =
      CarrierAccountType(9, 'CanadaPostAccount');
  static CarrierAccountType canpar = CarrierAccountType(10, 'CanparAccount');
  static CarrierAccountType columbusLastMile =
      CarrierAccountType(11, 'ColumbusLastMileAccount');
  static CarrierAccountType courierExpress =
      CarrierAccountType(12, 'CourierExpressAccount');
  static CarrierAccountType couriersPlease =
      CarrierAccountType(13, 'CouriersPleaseAccount');
  static CarrierAccountType daiPost = CarrierAccountType(14, 'DaiPostAccount');
  static CarrierAccountType deliverIt =
      CarrierAccountType(15, 'DeliverItAccount');
  static CarrierAccountType deutschePostUk =
      CarrierAccountType(16, 'DeutschePostUKAccount');
  static CarrierAccountType dhlEcommerceAsia =
      CarrierAccountType(17, 'DhlEcommerceAsiaAccount');
  static CarrierAccountType dhlEcs = CarrierAccountType(18, 'DhlEcsAccount');
  static CarrierAccountType dhlExpress =
      CarrierAccountType(19, 'DhlExpressAccount');
  static CarrierAccountType dhlPaket =
      CarrierAccountType(20, 'DhlPaketAccount');
  static CarrierAccountType dhlParcel =
      CarrierAccountType(21, 'DhlParcelAccount');
  static CarrierAccountType dpd = CarrierAccountType(22, 'DpdAccount');
  static CarrierAccountType dpdUk = CarrierAccountType(23, 'DpdUkAccount');
  static CarrierAccountType estafeta =
      CarrierAccountType(24, 'EstafetaAccount');
  static CarrierAccountType fastway = CarrierAccountType(25, 'FastwayAccount');
  static CarrierAccountType fedEx = CarrierAccountType(26, 'FedexAccount');
  static CarrierAccountType fedExCrossBorder =
      CarrierAccountType(27, 'FedexCrossBorderAccount');
  static CarrierAccountType fedExMailview =
      CarrierAccountType(28, 'FedexMailviewAccount');
  static CarrierAccountType fedExSameDayCity =
      CarrierAccountType(29, 'FedexSamedayCityAccount');
  static CarrierAccountType fedExSmartPost =
      CarrierAccountType(30, 'FedexSmartpostAccount');
  static CarrierAccountType firstMileConcise =
      CarrierAccountType(31, 'FirstMileConciseAccount');
  static CarrierAccountType globegistics =
      CarrierAccountType(32, 'GlobegisticsAccount');
  static CarrierAccountType gso = CarrierAccountType(33, 'GsoAccount');
  static CarrierAccountType hermes = CarrierAccountType(34, 'HermesAccount');
  static CarrierAccountType interlinkExpress =
      CarrierAccountType(35, 'InterlinkExpressAccount');
  static CarrierAccountType lasershipV2 =
      CarrierAccountType(36, 'LasershipV2Account');
  static CarrierAccountType loomisExpress =
      CarrierAccountType(37, 'LoomisExpressAccount');
  static CarrierAccountType lso = CarrierAccountType(38, 'LsoAccount');
  static CarrierAccountType newgistics =
      CarrierAccountType(39, 'NewgisticsAccount');
  static CarrierAccountType omniParcel =
      CarrierAccountType(40, 'OmniParcelAccount');
  static CarrierAccountType ontrac = CarrierAccountType(41, 'OntracAccount');
  static CarrierAccountType optima = CarrierAccountType(42, 'OptimaAccount');
  static CarrierAccountType osmWorldwide =
      CarrierAccountType(43, 'OsmWorldwideAccount');
  static CarrierAccountType parcelForce =
      CarrierAccountType(44, 'ParcelForceAccount');
  static CarrierAccountType parcll = CarrierAccountType(45, 'ParcllAccount');
  static CarrierAccountType passportGlobal =
      CarrierAccountType(46, 'PassportGlobalAccount');
  static CarrierAccountType purolator =
      CarrierAccountType(47, 'PurolatorAccount');
  static CarrierAccountType royalMail =
      CarrierAccountType(48, 'RoyalMailAccount');
  static CarrierAccountType rRDonnelley =
      CarrierAccountType(49, 'RRDonnelleyAccount');
  static CarrierAccountType sendle = CarrierAccountType(50, 'SendleAccount');
  static CarrierAccountType sFExpress =
      CarrierAccountType(51, 'SfExpressAccount');
  static CarrierAccountType smartKargo =
      CarrierAccountType(52, 'SmartKargoAccount');
  static CarrierAccountType sonic = CarrierAccountType(53, 'SonicAccount');
  static CarrierAccountType speedee = CarrierAccountType(54, 'SpeedeeAccount');
  static CarrierAccountType starTrack =
      CarrierAccountType(55, 'StarTrackAccount');
  static CarrierAccountType swyft = CarrierAccountType(56, 'SwyftAccount');
  static CarrierAccountType tForceConcise =
      CarrierAccountType(57, 'TforceConciseAccount');
  static CarrierAccountType uds = CarrierAccountType(58, 'UdsAccount');
  static CarrierAccountType ups = CarrierAccountType(59, 'UpsAccount');
  static CarrierAccountType upsIparcel =
      CarrierAccountType(60, 'UpsIparcelAccount');
  static CarrierAccountType upsMailInnovations =
      CarrierAccountType(61, 'UpsMailInnovationsAccount');
  static CarrierAccountType upsSurepost =
      CarrierAccountType(62, 'UpsSurepostAccount');
  static CarrierAccountType usps = CarrierAccountType(63, 'UspsAccount');
  static CarrierAccountType veho = CarrierAccountType(64, 'VehoAccount');
  static CarrierAccountType xDelivery =
      CarrierAccountType(65, 'XDeliveryAccount');

  CarrierAccountType(super.id, super.jsonValue);

  /// Get the [CarrierAccountType] from a [String].
  static CarrierAccountType? fromString(String? value) {
    switch (value) {
      case 'AmazonMwsAccount':
        return amazonMws;
      case 'ApcAccount':
        return apc;
      case 'AsendiaAccount':
        return asendia;
      case 'AsendiaUsaAccount':
        return asendiaUsa;
      case 'AustraliaPostAccount':
        return australiaPost;
      case 'AxlehireV3Account':
        return axlehireV3;
      case 'BetterTrucksAccount':
        return betterTrucks;
      case 'BondAccount':
        return bond;
      case 'CanadaPostAccount':
        return canadaPost;
      case 'CanparAccount':
        return canpar;
      case 'ColumbusLastMileAccount':
        return columbusLastMile;
      case 'CourierExpressAccount':
        return courierExpress;
      case 'CouriersPleaseAccount':
        return couriersPlease;
      case 'DaiPostAccount':
        return daiPost;
      case 'DeliverItAccount':
        return deliverIt;
      case 'DeutschePostUKAccount':
        return deutschePostUk;
      case 'DhlEcommerceAsiaAccount':
        return dhlEcommerceAsia;
      case 'DhlEcsAccount':
        return dhlEcs;
      case 'DhlExpressAccount':
        return dhlExpress;
      case 'DhlPaketAccount':
        return dhlPaket;
      case 'DhlParcelAccount':
        return dhlParcel;
      case 'DpdAccount':
        return dpd;
      case 'DpdUkAccount':
        return dpdUk;
      case 'EstafetaAccount':
        return estafeta;
      case 'FastwayAccount':
        return fastway;
      case 'FedexAccount':
        return fedEx;
      case 'FedexCrossBorderAccount':
        return fedExCrossBorder;
      case 'FedexMailviewAccount':
        return fedExMailview;
      case 'FedexSamedayCityAccount':
        return fedExSameDayCity;
      case 'FedexSmartpostAccount':
        return fedExSmartPost;
      case 'FirstMileConciseAccount':
        return firstMileConcise;
      case 'GlobegisticsAccount':
        return globegistics;
      case 'GsoAccount':
        return gso;
      case 'HermesAccount':
        return hermes;
      case 'InterlinkExpressAccount':
        return interlinkExpress;
      case 'LasershipV2Account':
        return lasershipV2;
      case 'LoomisExpressAccount':
        return loomisExpress;
      case 'LsoAccount':
        return lso;
      case 'NewgisticsAccount':
        return newgistics;
      case 'OmniParcelAccount':
        return omniParcel;
      case 'OntracAccount':
        return ontrac;
      case 'OptimaAccount':
        return optima;
      case 'OsmWorldwideAccount':
        return osmWorldwide;
      case 'ParcelForceAccount':
        return parcelForce;
      case 'ParcllAccount':
        return parcll;
      case 'PassportGlobalAccount':
        return passportGlobal;
      case 'PurolatorAccount':
        return purolator;
      case 'RoyalMailAccount':
        return royalMail;
      case 'RRDonnelleyAccount':
        return rRDonnelley;
      case 'SendleAccount':
        return sendle;
      case 'SfExpressAccount':
        return sFExpress;
      case 'SmartKargoAccount':
        return smartKargo;
      case 'SonicAccount':
        return sonic;
      case 'SpeedeeAccount':
        return speedee;
      case 'StarTrackAccount':
        return starTrack;
      case 'SwyftAccount':
        return swyft;
      case 'TforceConciseAccount':
        return tForceConcise;
      case 'UdsAccount':
        return uds;
      case 'UpsAccount':
        return ups;
      case 'UpsIparcelAccount':
        return upsIparcel;
      case 'UpsMailInnovationsAccount':
        return upsMailInnovations;
      case 'UpsSurepostAccount':
        return upsSurepost;
      case 'UspsAccount':
        return usps;
      case 'VehoAccount':
        return veho;
      case 'XDeliveryAccount':
        return xDelivery;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [CarrierAccountType].
  static String? asString(CarrierAccountType? carrierAccountType) =>
      carrierAccountType?.toString();
}

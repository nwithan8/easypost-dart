import 'dart:convert';
import 'dart:io';
import 'package:easypost/easypost.dart';

import 'fixture_structures.dart';
import 'test_utils.dart';

class Fixtures {
  static Map<String, dynamic> get _data {
    String path =
        '${Directory.current.path}/examples/official/fixtures/client-library-fixtures.json';
    String contents = TestUtils.readFile(path);
    return jsonDecode(contents);
  }

  static FixtureStructures get fixtureStructures {
    return FixtureStructures.fromJson(_data);
  }

  static CarrierAccountsCreate get basicCarrierAccount {
    return CarrierAccountsCreate(
        overrideParameters: fixtureStructures.carrierAccounts.basic);
  }

  static CustomsInfoCreate get basicCustomsInfo {
    return CustomsInfoCreate(overrideParameters: {
      "customs_info": fixtureStructures.customsInfos.basic
    });
  }

  static CustomsItemsCreate get basicCustomsItem {
    return CustomsItemsCreate(
        overrideParameters: fixtureStructures.customsItems.basic);
  }

  static InsuranceCreate get basicInsurance {
    return InsuranceCreate(
        overrideParameters: fixtureStructures.insurances.basic);
  }

  static OrdersCreate get basicOrder {
    return OrdersCreate(overrideParameters: fixtureStructures.orders.basic);
  }

  static ParcelsCreate get basicParcel {
    return ParcelsCreate(overrideParameters: fixtureStructures.parcels.basic);
  }

  static PickupsCreate get basicPickup {
    Map<String, dynamic> data = fixtureStructures.pickups.basic;

    const String pickupDate = '2023-01-01';
    data['min_datetime'] = pickupDate;
    data['max_datetime'] = pickupDate;

    return PickupsCreate(overrideParameters: data);
  }

  static ShipmentsCreate get basicShipment {
    return ShipmentsCreate(
        overrideParameters: fixtureStructures.shipments.basicDomestic);
  }

  static AddressesCreate get caAddress1 {
    return AddressesCreate(
        overrideParameters: fixtureStructures.addresses.caAddress1);
  }

  static AddressesCreate get caAddress2 {
    return AddressesCreate(
        overrideParameters: fixtureStructures.addresses.caAddress2);
  }

  static Map<String, dynamic> get creditCardDetails {
    return fixtureStructures.creditCards.test;
  }

  static ShipmentsCreate get fullShipment {
    return ShipmentsCreate(
        overrideParameters: fixtureStructures.shipments.full);
  }

  static AddressesCreate get incorrectAddress {
    return AddressesCreate(
        overrideParameters: fixtureStructures.addresses.incorrectAddress);
  }

  static ShipmentsCreate get oneCallBuyShipment {
    Map<String, dynamic> map = <String, dynamic>{
      "to_address": caAddress1,
      "from_address": caAddress2,
      "parcel": basicParcel,
      "service": uspsService,
      "carrier_accounts": [uspsCarrierAccountId],
      "carrier": usps,
    };
    return ShipmentsCreate(overrideParameters: map);
  }

  static int get pageSize {
    return fixtureStructures.pageSizes.five;
  }

  static String get pickupService {
    return fixtureStructures.serviceNames.usps.pickupService;
  }

  static Map<String, dynamic> get referralUser {
    return fixtureStructures.users.referral;
  }

  static String get reportDate => '2022-04-12';

  static String get reportIdPrefix => "shprep_";

  static String get reportType {
    return fixtureStructures.reportTypes.shipment;
  }

  static Map<String, dynamic> get rmaFormOptions {
    return fixtureStructures.formOptions.rma;
  }

  static Map<String, dynamic> get taxIdentifier {
    return fixtureStructures.taxIdentifiers.basic;
  }

  static String get usps {
    return fixtureStructures.carrierStrings.usps;
  }

  // This is the USPS carrier account ID that comes with your EasyPost account by default and should be used for all tests
  static String get uspsCarrierAccountId {
    // Use the EasyPost C# Client Library Test User USPS carrier account
    return "ca_7642d249fdcf47bcb5da9ea34c96dfcf";
  }

  static String get uspsService {
    return fixtureStructures.serviceNames.usps.firstService;
  }

  static String get webhookUrl {
    return fixtureStructures.webhookUrl;
  }
}

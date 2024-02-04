import 'dart:convert';
import 'dart:io';

import 'package:easypost/easypost.dart';
import 'package:easypost/src/internal/maps.dart';

import 'fixture_structures.dart';
import 'test_utils.dart';

class Fixtures {
  static Map<String, dynamic> get _data {
    String path =
        '${Directory.current.path}/examples/official/fixtures/client-library-fixtures.json';
    String contents = TestUtils.readFile(path);
    return jsonDecode(contents);
  }

  static String get webhookSecret {
    return "secret";
  }

  static List<int> get webhookEventBody {
    String data = "event body";
    return utf8.encode(data);
  }

  static Map<String, dynamic> get eventWebhookHeader {
    return {
      'X-Hmac-Signature':
          'hmac-sha256-hex=0c28f466dd939b8cd118617e53ef543a1b2e2536242b0a7e4e59016c6149ff64',
    };
  }

  static FixtureStructures get fixtureStructures {
    return FixtureStructures.fromJson(_data);
  }

  static CreateCarrierAccount get basicCarrierAccount {
    Map<String, dynamic> data = fixtureStructures.carrierAccounts.basic;
    return createCreateCarrierAccountParameters(data: data);
  }

  static CreateCustomsInfo get basicCustomsInfo {
    Map<String, dynamic> data = fixtureStructures.customsInfos.basic;
    return CreateCustomsInfo();
  }

  static CreateCustomsItem get basicCustomsItem {
    Map<String, dynamic> data = fixtureStructures.customsItems.basic;
    return createCreateCustomsItemParameters(data: data);
  }

  static CreateInsurance get basicInsurance {
    Map<String, dynamic> data = fixtureStructures.insurances.basic;
    return CreateInsurance();
  }

  static CreateOrder get basicOrder {
    Map<String, dynamic> data = fixtureStructures.orders.basic;
    return CreateOrder();
  }

  static CreateParcel get basicParcel {
    Map<String, dynamic> data = fixtureStructures.parcels.basic;
    return createCreateParcelParameters(data: data);
  }

  static CreatePickup get basicPickup {
    Map<String, dynamic> data = fixtureStructures.pickups.basic;

    const String pickupDate = '2023-01-01';
    data['min_datetime'] = pickupDate;
    data['max_datetime'] = pickupDate;

    return CreatePickup();
  }

  static CreateShipment get basicShipment {
    Map<String, dynamic> data = fixtureStructures.shipments.basicDomestic;
    return createCreateShipmentParameters(data: data);
  }

  static CreateAddress get caAddress1 {
    Map<String, dynamic> data = fixtureStructures.addresses.caAddress1;
    return createCreateAddressParameters(data: data);
  }

  static CreateAddress get caAddress2 {
    Map<String, dynamic> data = fixtureStructures.addresses.caAddress2;
    return createCreateAddressParameters(data: data);
  }

  static Map<String, dynamic> get creditCardDetails {
    return fixtureStructures.creditCards.test;
  }

  static CreateShipment get fullShipment {
    Map<String, dynamic> data = fixtureStructures.shipments.full;
    return CreateShipment();
  }

  static CreateAddress get incorrectAddress {
    Map<String, dynamic> data = fixtureStructures.addresses.incorrectAddress;
    return createCreateAddressParameters(data: data);
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

  static CreateAddress createCreateAddressParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateAddress parameters = CreateAddress();

    parameters.name = getOrDefaultString(data, "name");
    parameters.company = getOrDefaultString(data, "company");
    parameters.street1 = getOrDefaultString(data, "street1");
    parameters.street2 = getOrDefaultString(data, "street2");
    parameters.city = getOrDefaultString(data, "city");
    parameters.state = getOrDefaultString(data, "state");
    parameters.zip = getOrDefaultString(data, "zip");
    parameters.country = getOrDefaultString(data, "country");
    parameters.phone = getOrDefaultString(data, "phone");
    parameters.email = getOrDefaultString(data, "email");

    return parameters;
  }

  static CreateShipment createCreateShipmentParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateShipment parameters = CreateShipment();

    parameters.toAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "to_address"));
    parameters.fromAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "from_address"));
    parameters.parcel =
        createCreateParcelParameters(data: getOrDefaultMap(data, "parcel"));
    parameters.customsInfo = createCreateCustomsInfoParameters(
        data: getOrDefaultMap(data, "customs_info"));
    parameters.options =
        createShipmentOptionsParameters(data: getOrDefaultMap(data, "options"));

    /*
    List<CreateCarrierAccount> carrierAccountsList = List<CreateCarrierAccount>.empty(growable: true);
    for (Map<String, dynamic>? item in getOrDefaultMapList(data, "carrier_accounts")) {
      carrierAccountsList.add(createCreateCarrierAccountParameters(data: item));
    }
    parameters.carrierAccounts = carrierAccountsList;
     */

    return parameters;
  }

  static CreateParcel createCreateParcelParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateParcel parameters = CreateParcel();

    parameters.weight = getOrDefaultDouble(data, "weight");
    parameters.length = getOrDefaultDouble(data, "length");
    parameters.width = getOrDefaultDouble(data, "width");
    parameters.height = getOrDefaultDouble(data, "height");

    return parameters;
  }

  static CreateCustomsInfo createCreateCustomsInfoParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateCustomsInfo parameters = CreateCustomsInfo();

    parameters.eelPfc = getOrDefaultString(data, "eel_pfc");
    parameters.customsCertify = getOrDefaultBool(data, "customs_certify");
    parameters.customsSigner = getOrDefaultString(data, "customs_signer");
    parameters.contentsType = getOrDefaultString(data, "contents_type");
    parameters.contentsExplanation =
        getOrDefaultString(data, "contents_explanation");
    parameters.restrictionType = getOrDefaultString(data, "restriction_type");
    parameters.nonDeliveryOption =
        getOrDefaultString(data, "non_delivery_option");

    /*
    List<CreateCustomsItem> parametersList = List<CreateCustomsItem>.empty(growable: true);
    for (Map<String, dynamic>? item in getOrDefaultMapList(data, "customs_items")) {
      parametersList.add(createCreateCustomsItemParameters(data: item));
    }
    parameters.customsItems = parametersList;
     */

    return parameters;
  }

  static CreateCustomsItem createCreateCustomsItemParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateCustomsItem parameters = CreateCustomsItem();

    parameters.description = getOrDefaultString(data, "description");
    parameters.quantity = getOrDefaultInt(data, "quantity");
    parameters.value = getOrDefaultDouble(data, "value");
    parameters.weight = getOrDefaultDouble(data, "weight");
    parameters.hsTariffNumber = getOrDefaultString(data, "hs_tariff_number");
    parameters.originCountry = getOrDefaultString(data, "origin_country");

    return parameters;
  }

  static Options createShipmentOptionsParameters({Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    Options parameters = Options.fromJson(data);

    return parameters;
  }

  static CreateCarrierAccount createCreateCarrierAccountParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateCarrierAccount parameters = CreateCarrierAccount();

    parameters.type =
        CarrierAccountType.fromString(getOrDefaultString(data, "type"));
    parameters.description = getOrDefaultString(data, "description");

    return parameters;
  }
}

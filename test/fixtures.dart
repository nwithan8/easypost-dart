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

  static OpenCarrierAccount get basicCarrierAccount {
    final params = OpenCarrierAccount();
    params.type = CarrierAccountType.speedee;

    return params;
  }

  static AddFedExCarrierAccount get basicFedExCarrierAccount {
    final params = AddFedExCarrierAccount();
    params.accountNumber = "RANDOM";
    params.corporateAddressCity = "RANDOM";
    params.corporateAddressCountryCode = "RANDOM";
    params.corporateAddressPostalCode = "RANDOM";
    params.corporateAddressState = "RANDOM";
    params.corporateAddressStreet = "RANDOM";
    params.corporateCompanyName = "RANDOM";
    params.corporateEmailAddress = "RANDOM";
    params.corporateFirstName = "RANDOM";
    params.corporateJobTitle = "RANDOM";
    params.corporateLastName = "RANDOM";
    params.corporatePhoneNumber = "RANDOM";
    params.shippingAddressCity = "RANDOM";
    params.shippingAddressCountryCode = "RANDOM";
    params.shippingAddressPostalCode = "RANDOM";
    params.shippingAddressState = "RANDOM";
    params.shippingAddressStreet = "RANDOM";

    return params;
  }

  static CreateTracker get basicTracker {
    CreateTracker parameters = CreateTracker();

    parameters.trackingCode = "EZ1000000001";
    parameters.carrier = Fixtures.usps;

    return parameters;
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
    return createCreateInsuranceParameters(data: data);
  }

  static CreateOrder get basicOrder {
    Map<String, dynamic> data = fixtureStructures.orders.basic;
    return createCreateOrderParameters(data: data);
  }

  static CreateParcel get basicParcel {
    Map<String, dynamic> data = fixtureStructures.parcels.basic;
    return createCreateParcelParameters(data: data);
  }

  static CreatePickup get basicPickup {
    Map<String, dynamic> data = fixtureStructures.pickups.basic;

    const String pickupDate = '2024-02-21';
    data['min_datetime'] = pickupDate;
    data['max_datetime'] = pickupDate;

    return createCreatePickupParameters(data: data);
  }

  static CreateShipment get basicShipment {
    Map<String, dynamic> data = fixtureStructures.shipments.basicDomestic;
    return createCreateShipmentParameters(data: data);
  }

  static RetrieveQuotedRates get retrieveQuotedRatesParameters {
    RetrieveQuotedRates parameters = RetrieveQuotedRates();
    parameters.carrierAccountIds = [uspsCarrierAccountId];
    parameters.fromAddress = basicShipment.fromAddress;
    parameters.parcel = basicShipment.parcel;
    parameters.reference = basicShipment.reference;
    parameters.service = basicShipment.service;
    parameters.toAddress = basicShipment.toAddress;
    parameters.options = basicShipment.options;

    return parameters;
  }

  static Future<Shipment> createAndBuyShipment(Client client) async {
    CreateShipment parameters = basicShipment;
    Shipment shipment = await client.shipments.create(parameters);

    final rate = await client.shipments
        .getLowestRateFor(shipment, includeCarriers: ['USPS']);

    BuyShipment buyShipmentParameters = BuyShipment();
    buyShipmentParameters.rate = rate;

    return await client.shipments.buy(shipment.id, buyShipmentParameters);
  }

  static CreateShipment get oneCallBuyShipment {
    CreateShipment parameters = basicShipment;
    parameters.carrierAccountIds = [uspsCarrierAccountId];
    parameters.carrier = usps;
    parameters.service = uspsService;

    return parameters;
  }

  static CreateAddress get caAddress1 {
    Map<String, dynamic> data = fixtureStructures.addresses.caAddress1;
    return createCreateAddressParameters(data: data);
  }

  static CreateEndShipper get endShipper {
    Map<String, dynamic> data = fixtureStructures.addresses.caAddress1;
    return createCreateEndShipperParameters(data: data);
  }

  static CreateAddress get caAddress2 {
    Map<String, dynamic> data = fixtureStructures.addresses.caAddress2;
    return createCreateAddressParameters(data: data);
  }

  static Map<String, dynamic> get creditCardDetails {
    return fixtureStructures.creditCards.test;
  }

  static AddCreditCard get addCreditCardParams {
    Map<String, dynamic> data = creditCardDetails;
    AddCreditCard parameters = AddCreditCard();

    parameters.creditCardNumber = getOrDefaultInt(data, "number");
    parameters.creditCardExpirationMonth = getOrDefaultInt(data, "expiration_month");
    parameters.creditCardExpirationYear = getOrDefaultInt(data, "expiration_year");
    parameters.creditCardCvv = getOrDefaultInt(data, "cvc");

    return parameters;
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

  static CreateReferralCustomer get createReferralCustomer {
    Map<String, dynamic> data = referralUser;

    CreateReferralCustomer parameters = CreateReferralCustomer();
    parameters.name = getOrDefaultString(data, "name");
    parameters.email = getOrDefaultString(data, "email");
    parameters.phoneNumber = getOrDefaultString(data, "phone");

    return parameters;
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

  static CreateEndShipper createCreateEndShipperParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateEndShipper parameters = CreateEndShipper();

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

  static CreatePickup createCreatePickupParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreatePickup parameters = CreatePickup();

    parameters.address =
        createCreateAddressParameters(data: getOrDefaultMap(data, "address"));
    parameters.reference = getOrDefaultString(data, "reference");
    parameters.minDatetime = getOrDefaultDateTime(data, "min_datetime");
    parameters.maxDatetime = getOrDefaultDateTime(data, "max_datetime");
    parameters.isAccountAddress = getOrDefaultBool(data, "is_account_address");
    parameters.instructions = getOrDefaultString(data, "instructions");

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

  static CreateInsurance createCreateInsuranceParameters(
      {Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateInsurance parameters = CreateInsurance();

    parameters.trackingCode = getOrDefaultString(data, "tracking_code");
    parameters.amount = getOrDefaultDouble(data, "amount");
    parameters.carrier = getOrDefaultString(data, "carrier");
    parameters.fromAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "from_address"));
    parameters.toAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "to_address"));

    return parameters;
  }

  static CreateOrder createCreateOrderParameters({Map<String, dynamic>? data}) {
    if (data == null) {
      data = Map<String, dynamic>();
    }

    CreateOrder parameters = CreateOrder();

    parameters.toAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "to_address"));
    parameters.fromAddress = createCreateAddressParameters(
        data: getOrDefaultMap(data, "from_address"));

    parameters.shipments = List<CreateShipment>.empty(growable: true);
    List<Map<String, dynamic>>? shipmentData =
        getOrDefaultMapList(data, "shipments");
    if (shipmentData != null) {
      for (Map<String, dynamic> item in shipmentData) {
        parameters.shipments?.add(createCreateShipmentParameters(data: item));
      }
    }

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
    // parameters.endorsement = getOrDefaultString(data, "endorsement");

    return parameters;
  }
}

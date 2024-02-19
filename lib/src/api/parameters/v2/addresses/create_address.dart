import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/v2/shipments/create_shipment.dart';
import 'package:easypost/src/api/parameters/v2/insurance/create_insurance.dart';
import 'package:easypost/src/api/parameters/v2/orders/create_order.dart';
import 'package:easypost/src/api/parameters/v2/pickups/create_pickup.dart';
import 'package:easypost/src/api/parameters/v2/rates/retrieve_quoted_rates.dart';

@reflector
class CreateAddress extends Parameters implements IAddressParameter {
  @SubJsonParameter(CreateShipment, Necessity.optional, ['id'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['id'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['id'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['id'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['id'])
  String? id;

  @JsonParameter(Necessity.optional, ['address', 'carrier_facility'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['carrier_facility'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['carrier_facility'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['carrier_facility'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['carrier_facility'])
  @SubJsonParameter(
      RetrieveQuotedRates, Necessity.optional, ['carrier_facility'])
  String? carrierFacility;

  @JsonParameter(Necessity.optional, ['address', "city"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['city'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['city'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['city'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['city'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['city'])
  String? city;

  @JsonParameter(Necessity.optional, ['address', "company"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['company'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['company'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['company'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['company'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['company'])
  String? company;

  @JsonParameter(Necessity.optional, ['address', "country"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['country'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['country'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['country'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['country'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['country'])
  String? country;

  @JsonParameter(Necessity.optional, ['address', "email"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['email'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['email'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['email'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['email'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['email'])
  String? email;

  @JsonParameter(Necessity.optional, ['address', "federal_tax_id"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['federal_tax_id'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['federal_tax_id'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['federal_tax_id'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['federal_tax_id'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['federal_tax_id'])
  String? federalTaxId;

  @JsonParameter(Necessity.optional, ['address', "name"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['name'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['name'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['name'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['name'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['name'])
  String? name;

  @JsonParameter(Necessity.optional, ['address', "phone"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['phone'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['phone'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['phone'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['phone'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['phone'])
  String? phone;

  @JsonParameter(Necessity.optional, ['address', "residential"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['residential'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['residential'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['residential'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['residential'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['residential'])
  bool? residential;

  @JsonParameter(Necessity.optional, ['address', "state"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['state'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['state'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['state'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['state'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['state'])
  String? state;

  @JsonParameter(Necessity.optional, ['address', "state_tax_id"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['state_tax_id'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['state_tax_id'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['state_tax_id'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['state_tax_id'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['state_tax_id'])
  String? stateTaxId;

  @JsonParameter(Necessity.optional, ['address', "street1"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['street1'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['street1'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['street1'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['street1'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['street1'])
  String? street1;

  @JsonParameter(Necessity.optional, ['address', "street2"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['street2'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['street2'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['street2'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['street2'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['street2'])
  String? street2;

  @JsonParameter(Necessity.optional, ['verify'])
  // Not included in any sub-parameter sets
  bool? verify;

  // verify_strict does the exact same thing as verify

  @JsonParameter(Necessity.optional, ['address', "zip"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['zip'])
  @SubJsonParameter(CreateInsurance, Necessity.optional, ['zip'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['zip'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['zip'])
  @SubJsonParameter(RetrieveQuotedRates, Necessity.optional, ['zip'])
  String? zip;

  CreateAddress() : super();
}

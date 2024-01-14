import 'package:easypost/easypost.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateAddress extends Parameters implements IAddressParameter {
  @JsonParameter(Necessity.optional, ['address', 'carrier_facility'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['carrier_facility'])
  String? carrierFacility;

  @JsonParameter(Necessity.optional, ['address', "city"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['city'])
  String? city;

  @JsonParameter(Necessity.optional, ['address', "company"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['company'])
  String? company;

  @JsonParameter(Necessity.optional, ['address', "country"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['country'])
  String? country;

  @JsonParameter(Necessity.optional, ['address', "email"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['email'])
  String? email;

  @JsonParameter(Necessity.optional, ['address', "federal_tax_id"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['federal_tax_id'])
  String? federalTaxId;

  @JsonParameter(Necessity.optional, ['address', "name"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['name'])
  String? name;

  @JsonParameter(Necessity.optional, ['address', "phone"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['phone'])
  String? phone;

  @JsonParameter(Necessity.optional, ['address', "residential"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['residential'])
  bool? residential;

  @JsonParameter(Necessity.optional, ['address', "state"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['state'])
  String? state;

  @JsonParameter(Necessity.optional, ['address', "state_tax_id"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['state_tax_id'])
  String? stateTaxId;

  @JsonParameter(Necessity.optional, ['address', "street1"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['street1'])
  String? street1;

  @JsonParameter(Necessity.optional, ['address', "street2"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['street2'])
  String? street2;

  @JsonParameter(Necessity.optional, ['verify'])
  bool? verify;

  @JsonParameter(Necessity.optional, ["verify_strict"])
  bool? strictlyVerify;

  @JsonParameter(Necessity.optional, ['address', "zip"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['zip'])
  String? zip;

  CreateAddress() : super();
}

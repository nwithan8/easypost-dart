import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class AddressCreate extends Create {
  @RequestParameter(Necessity.optional, ['address', "carrier_facility"])
  String? carrierFacility;

  @RequestParameter(Necessity.optional, ['address', "city"])
  String? city;

  @RequestParameter(Necessity.optional, ['address', "company"])
  String? company;

  @RequestParameter(Necessity.optional, ['address', "country"])
  String? country;

  @RequestParameter(Necessity.optional, ['address', "email"])
  String? email;

  @RequestParameter(Necessity.optional, ['address', "federal_tax_id"])
  String? federalTaxId;

  @RequestParameter(Necessity.optional, ['address', "name"])
  String? name;

  @RequestParameter(Necessity.optional, ['address', "phone"])
  String? phone;

  @RequestParameter(Necessity.optional, ['address', "residential"])
  bool? residential;

  @RequestParameter(Necessity.optional, ['address', "state"])
  String? state;

  @RequestParameter(Necessity.optional, ['address', "state_tax_id"])
  String? stateTaxId;

  @RequestParameter(Necessity.optional, ['address', "street1"])
  String? street1;

  @RequestParameter(Necessity.optional, ['address', "street2"])
  String? street2;

  @RequestParameter(Necessity.optional, ['verify'])
  bool? verify;

  @RequestParameter(Necessity.optional, ["verify_strict"])
  bool? strictlyVerify;

  @RequestParameter(Necessity.optional, ['address', "zip"])
  String? zip;

  AddressCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);

//TODO: matches existing object
}

class AddressUpdate extends AddressCreate {
  // Update is the same as Create
  AddressUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class AddressAll extends All {
  AddressAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

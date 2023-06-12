import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

@reflector
class AddressesCreate extends Create {
  @JsonParameter(Necessity.optional, ['address', "carrier_facility"])
  String? carrierFacility;

  @JsonParameter(Necessity.optional, ['address', "city"])
  String? city;

  @JsonParameter(Necessity.optional, ['address', "company"])
  String? company;

  @JsonParameter(Necessity.optional, ['address', "country"])
  String? country;

  @JsonParameter(Necessity.optional, ['address', "email"])
  String? email;

  @JsonParameter(Necessity.optional, ['address', "federal_tax_id"])
  String? federalTaxId;

  @JsonParameter(Necessity.optional, ['address', "name"])
  String? name;

  @JsonParameter(Necessity.optional, ['address', "phone"])
  String? phone;

  @JsonParameter(Necessity.optional, ['address', "residential"])
  bool? residential;

  @JsonParameter(Necessity.optional, ['address', "state"])
  String? state;

  @JsonParameter(Necessity.optional, ['address', "state_tax_id"])
  String? stateTaxId;

  @JsonParameter(Necessity.optional, ['address', "street1"])
  String? street1;

  @JsonParameter(Necessity.optional, ['address', "street2"])
  String? street2;

  @JsonParameter(Necessity.optional, ['verify'])
  bool? verify;

  @JsonParameter(Necessity.optional, ["verify_strict"])
  bool? strictlyVerify;

  @JsonParameter(Necessity.optional, ['address', "zip"])
  String? zip;

  AddressesCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);

//TODO: matches existing object
}

@reflector
class AddressesUpdate extends AddressesCreate {
  // Update is the same as Create
  AddressesUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class AddressesAll extends All {
  AddressesAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

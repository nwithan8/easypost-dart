import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateEndShipper extends Parameters {
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

  CreateEndShipper() : super();
}

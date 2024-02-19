import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/end_shipper.dart';

@reflector
class UpdateEndShipper extends Parameters {
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
  bool? isResidential;

  @JsonParameter(Necessity.optional, ['address', "state"])
  String? state;

  @JsonParameter(Necessity.optional, ['address', "state_tax_id"])
  String? stateTaxId;

  @JsonParameter(Necessity.optional, ['address', "street1"])
  String? street1;

  @JsonParameter(Necessity.optional, ['address', "street2"])
  String? street2;

  @JsonParameter(Necessity.optional, ['address', "zip"])
  String? zip;

  UpdateEndShipper(EndShipper endShipper) {
    carrierFacility = endShipper.carrierFacility;
    city = endShipper.city;
    company = endShipper.company;
    country = endShipper.country;
    email = endShipper.email;
    federalTaxId = endShipper.federalTaxId;
    name = endShipper.name;
    phone = endShipper.phone;
    isResidential = endShipper.isResidential;
    state = endShipper.state;
    stateTaxId = endShipper.stateTaxId;
    street1 = endShipper.street1;
    street2 = endShipper.street2;
    zip = endShipper.zip;
  }
}

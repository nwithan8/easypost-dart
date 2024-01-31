import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class OpenCarrierAccount extends Parameters {
  @JsonParameter(Necessity.optional, ['carrier_account', 'name'])
  String? name;

  @JsonParameter(Necessity.optional, ['carrier_account', 'title'])
  String? title;

  @JsonParameter(Necessity.optional, ['carrier_account', 'company'])
  String? company;

  @JsonParameter(Necessity.optional, ['carrier_account', 'street1'])
  String? street1;

  @JsonParameter(Necessity.optional, ['carrier_account', 'street2'])
  String? street2;

  @JsonParameter(Necessity.optional, ['carrier_account', 'city'])
  String? city;

  @JsonParameter(Necessity.optional, ['carrier_account', 'state'])
  String? state;

  @JsonParameter(Necessity.optional, ['carrier_account', 'postal_code'])
  String? postalCode;

  @JsonParameter(Necessity.optional, ['carrier_account', 'country'])
  String? country;

  @JsonParameter(Necessity.optional, ['carrier_account', 'phone'])
  String? phone;

  @JsonParameter(Necessity.optional, ['carrier_account', 'email'])
  String? email;

  @JsonParameter(Necessity.optional, ['carrier_account', 'website'])
  String? website;

  @JsonParameter(Necessity.optional, ['carrier_account', 'description'])
  String? description;

  @JsonParameter(Necessity.optional, ['carrier_account', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['carrier_account', 'set_dummy_account'])
  bool? setDummyAccount;

  @JsonParameter(Necessity.optional, ['carrier_account', 'type'])
  CarrierAccountType? type;

  OpenCarrierAccount() : super();
}

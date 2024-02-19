import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class AddUspsCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "address_city"])
  String? addressCity;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "address_state"])
  String? addressState;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "address_street"])
  String? addressStreet;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "address_zip"])
  String? addressZip;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "company_name"])
  String? companyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "email"])
  String? email;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "phone"])
  String? phone;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "shipper_id"])
  String? shipperId;

  AddUspsCarrierAccount()
      : super(CarrierAccountType.usps, defaultCarrierAccountCreationEndpoint);
}

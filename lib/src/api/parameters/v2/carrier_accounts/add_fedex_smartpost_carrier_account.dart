import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';

@reflector
class AddFedExSmartPostCarrierAccount extends AddCarrierAccount {
  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "account_number"])
  String? accountNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_city"])
  String? corporateAddressCity;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_country_code"])
  String? corporateAddressCountryCode;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_postal_code"])
  String? corporateAddressPostalCode;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_state"])
  String? corporateAddressState;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_streets"])
  String? corporateAddressStreet;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_company_name"])
  String? corporateCompanyName;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_email_address"])
  String? corporateEmailAddress;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_first_name"])
  String? corporateFirstName;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_job_title"])
  String? corporateJobTitle;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_last_name"])
  String? corporateLastName;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_phone_number"])
  String? corporatePhoneNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "hub_id"])
  String? hubId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_city"])
  String? shippingAddressCity;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_country_code"])
  String? shippingAddressCountryCode;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_postal_code"])
  String? shippingAddressPostalCode;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_state"])
  String? shippingAddressState;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_streets"])
  String? shippingAddressStreet;

  AddFedExSmartPostCarrierAccount()
      : super(
            CarrierAccountType.fedExSmartPost, registerCarrierAccountEndpoint);
}

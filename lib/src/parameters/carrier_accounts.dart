import 'package:easypost/src/utilities/parameter_annotation.dart';

import '_generic.dart';

class CarrierAccountsCreate extends Create {
  @JsonParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @JsonParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @JsonParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "type"])
  String? type;

  CarrierAccountsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsCreateFedEx extends CarrierAccountsCreate {
  @override
  @JsonParameter(Necessity.required, ['carrier_account', "type"])
  String? type = "FedexAccount";

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

  CarrierAccountsCreateFedEx({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsCreateUps extends CarrierAccountsCreate {
  @override
  @JsonParameter(Necessity.required, ['carrier_account', "type"])
  String? type = "UpsAccount";

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "city"])
  String? city;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "company"])
  String? companyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "country"])
  String? country;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "email"])
  String? email;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_amount"])
  String? invoiceAmount;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_control_id"])
  String? invoiceControlId;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_currency"])
  String? invoiceCurrency;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_date"])
  String? invoiceDate;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_number"])
  String? invoiceNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "phone"])
  String? phoneNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "registration_data", "postal_code"])
  String? postalCode;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "title"])
  String? registrarJobTitle;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "name"])
  String? registrarName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "state"])
  String? state;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "street1"])
  String? street;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "registration_data", "street2"])
  String? street2;

  @JsonParameter(
      Necessity.required, ['carrier_account', "registration_data", "website"])
  String? website;

  CarrierAccountsCreateUps({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsUpdate extends Update {
  @JsonParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @JsonParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @JsonParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  CarrierAccountsUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsAll extends All {
  CarrierAccountsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

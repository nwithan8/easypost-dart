import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '_generic.dart';

class CarrierAccountsCreate extends Create {
  @RequestParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @RequestParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @RequestParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @RequestParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  @RequestParameter(Necessity.optional, ['carrier_account', "type"])
  String? type;

  CarrierAccountsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsCreateFedEx extends Create {
  @RequestParameter(Necessity.required, ['carrier_account', "type"])
  String? type = "FedexAccount";

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "account_number"])
  String? accountNumber;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_city"])
  String? corporateAddressCity;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_country_code"])
  String? corporateAddressCountryCode;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_postal_code"])
  String? corporateAddressPostalCode;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_state"])
  String? corporateAddressState;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_streets"])
  String? corporateAddressStreet;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_company_name"])
  String? corporateCompanyName;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_email_address"])
  String? corporateEmailAddress;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_first_name"])
  String? corporateFirstName;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_job_title"])
  String? corporateJobTitle;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_last_name"])
  String? corporateLastName;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "corporate_phone_number"])
  String? corporatePhoneNumber;

  @RequestParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @RequestParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_city"])
  String? shippingAddressCity;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_country_code"])
  String? shippingAddressCountryCode;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_postal_code"])
  String? shippingAddressPostalCode;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_state"])
  String? shippingAddressState;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "shipping_streets"])
  String? shippingAddressStreet;

  CarrierAccountsCreateFedEx({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsCreateUps extends Create {
  @RequestParameter(Necessity.required, ['carrier_account', "type"])
  String? type = "UpsAccount";

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "account_number"])
  String? accountNumber;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "city"])
  String? city;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "company"])
  String? companyName;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "country"])
  String? country;

  @RequestParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "email"])
  String? email;

  @RequestParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_amount"])
  String? invoiceAmount;

  @RequestParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_control_id"])
  String? invoiceControlId;

  @RequestParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_currency"])
  String? invoiceCurrency;

  @RequestParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_date"])
  String? invoiceDate;

  @RequestParameter(Necessity.optional,
      ['carrier_account', "registration_data", "invoice_number"])
  String? invoiceNumber;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "phone"])
  String? phoneNumber;

  @RequestParameter(Necessity.required,
      ['carrier_account', "registration_data", "postal_code"])
  String? postalCode;

  @RequestParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "title"])
  String? registrarJobTitle;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "name"])
  String? registrarName;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "state"])
  String? state;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "street1"])
  String? street;

  @RequestParameter(
      Necessity.optional, ['carrier_account', "registration_data", "street2"])
  String? street2;

  @RequestParameter(
      Necessity.required, ['carrier_account', "registration_data", "website"])
  String? website;

  CarrierAccountsCreateUps({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsUpdate extends Update {
  @RequestParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @RequestParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @RequestParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @RequestParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  CarrierAccountsUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CarrierAccountsAll extends All {
  CarrierAccountsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

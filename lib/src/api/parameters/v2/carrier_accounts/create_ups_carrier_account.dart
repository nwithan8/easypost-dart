import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';

@reflector
class CreateUpsCarrierAccount extends CreateCarrierAccount {
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

  CreateUpsCarrierAccount() : super(CarrierAccountType.ups, registerCarrierAccountEndpoint);
}

import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateLasershipV2CarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_id"])
  String? apiId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "cargo_claim_value"])
  String? cargoClaimValue;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "facility"])
  String? facility;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_city"])
  String? injectionCity;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_contact"])
  String? injectionContact;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_country"])
  String? injectionCountry;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_email"])
  String? injectionEmail;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_instruction"])
  String? injectionInstruction;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_location_type"])
  String? injectionLocationType;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_note"])
  String? injectionNote;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_organization"])
  String? injectionOrganization;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_phone"])
  String? injectionPhone;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_phone_ext"])
  String? injectionPhoneExt;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_state"])
  String? injectionState;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_street1"])
  String? injectionStreet1;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_street2"])
  String? injectionStreet2;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "injection_zip"])
  String? injectionZip;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "is_reseller"])
  String? isReseller;

  CreateLasershipV2CarrierAccount()
      : super(CarrierAccountType.lasershipV2,
            defaultCarrierAccountCreationEndpoint);
}

import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddAsendiaUsaCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "carrier_facility"])
  String? carrierFacility;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "sub_account_number"])
  String? subAccountNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "carrier_facility"])
  String? testCarrierFacility;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "username"])
  String? testUsername;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "sub_account_number"])
  String? testSubAccountNumber;

  AddAsendiaUsaCarrierAccount()
      : super(CarrierAccountType.asendiaUsa,
            defaultCarrierAccountCreationEndpoint);
}

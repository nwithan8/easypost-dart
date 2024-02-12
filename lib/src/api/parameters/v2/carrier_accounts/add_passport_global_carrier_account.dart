import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddPassportGlobalCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "company_name"])
  String? companyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "email"])
  String? email;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "name"])
  String? name;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "phone"])
  String? phone;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "company_name"])
  String? testCompanyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "email"])
  String? testEmail;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "name"])
  String? testName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "phone"])
  String? testPhone;

  AddPassportGlobalCarrierAccount()
      : super(CarrierAccountType.passportGlobal,
            defaultCarrierAccountCreationEndpoint);
}

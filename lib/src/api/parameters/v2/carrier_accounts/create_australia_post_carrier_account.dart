import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateAustraliaPostCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_secret"])
  String? apiSecret;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "print_as_you_go"])
  String? printAsYouGo;

  CreateAustraliaPostCarrierAccount() : super(CarrierAccountType.australiaPost, defaultCarrierAccountCreationEndpoint);
}

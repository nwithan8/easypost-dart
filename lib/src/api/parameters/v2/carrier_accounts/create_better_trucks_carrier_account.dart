import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateBetterTrucksCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;
  
  CreateBetterTrucksCarrierAccount() : super(CarrierAccountType.betterTrucks, defaultCarrierAccountCreationEndpoint);
}

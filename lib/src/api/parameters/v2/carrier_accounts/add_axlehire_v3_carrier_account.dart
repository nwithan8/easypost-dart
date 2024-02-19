import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddAxlehireV3CarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;

  AddAxlehireV3CarrierAccount()
      : super(CarrierAccountType.axlehireV3,
            defaultCarrierAccountCreationEndpoint);
}

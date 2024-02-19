import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddOmniParcelCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_access_key"])
  String? apiAccessKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "return_api_access_key"])
  String? returnApiAccessKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "api_access_key"])
  String? testApiAccessKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "return_api_access_key"])
  String? testReturnApiAccessKey;

  AddOmniParcelCarrierAccount()
      : super(CarrierAccountType.omniParcel,
            defaultCarrierAccountCreationEndpoint);
}

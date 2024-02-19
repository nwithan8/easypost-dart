import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddColumbusLastMileCarrierAccount extends AddCarrierAccount {
  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "tracking_code_prefix"])
  String? trackingCodePrefix;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "tracking_code_prefix"])
  String? testTrackingCodePrefix;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "username"])
  String? testUsername;

  AddColumbusLastMileCarrierAccount()
      : super(CarrierAccountType.columbusLastMile,
            defaultCarrierAccountCreationEndpoint);
}

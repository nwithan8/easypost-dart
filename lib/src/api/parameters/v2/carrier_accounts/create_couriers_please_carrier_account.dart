import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateCouriersPleaseCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "username"])
  String? testUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  CreateCouriersPleaseCarrierAccount()
      : super(CarrierAccountType.couriersPlease,
            defaultCarrierAccountCreationEndpoint);
}

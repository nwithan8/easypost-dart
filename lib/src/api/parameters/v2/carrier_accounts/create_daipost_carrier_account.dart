import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateDaiPostCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_code"])
  String? accountCode;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "origin_terminal"])
  String? originTerminal;

  CreateDaiPostCarrierAccount()
      : super(
            CarrierAccountType.daiPost, defaultCarrierAccountCreationEndpoint);
}

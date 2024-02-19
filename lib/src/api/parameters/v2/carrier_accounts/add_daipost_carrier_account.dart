import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDaiPostCarrierAccount extends AddCarrierAccount {
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

  AddDaiPostCarrierAccount()
      : super(
            CarrierAccountType.daiPost, defaultCarrierAccountCreationEndpoint);
}

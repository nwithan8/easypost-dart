import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateHermesCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_license"])
  String? clientLicense;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_name"])
  String? clientName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "group_id"])
  String? groupId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  CreateHermesCarrierAccount()
      : super(CarrierAccountType.hermes, defaultCarrierAccountCreationEndpoint);
}

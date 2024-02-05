import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateDeutschePostUkCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_secret"])
  String? clientSecret;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "client_id"])
  String? testClientId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "client_secret"])
  String? testClientSecret;

  CreateDeutschePostUkCarrierAccount()
      : super(CarrierAccountType.deutschePostUk,
            defaultCarrierAccountCreationEndpoint);
}

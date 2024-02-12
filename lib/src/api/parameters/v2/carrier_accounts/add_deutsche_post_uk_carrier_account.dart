import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDeutschePostUkCarrierAccount extends AddCarrierAccount {
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

  AddDeutschePostUkCarrierAccount()
      : super(CarrierAccountType.deutschePostUk,
            defaultCarrierAccountCreationEndpoint);
}

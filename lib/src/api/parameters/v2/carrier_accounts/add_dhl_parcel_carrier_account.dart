import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDhlParcelCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "user_id"])
  String? userId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "user_id"])
  String? testUserId;

  AddDhlParcelCarrierAccount()
      : super(CarrierAccountType.dhlParcel,
            defaultCarrierAccountCreationEndpoint);
}

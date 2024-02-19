import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDeliverItCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "username"])
  String? testUsername;

  AddDeliverItCarrierAccount()
      : super(CarrierAccountType.deliverIt,
            defaultCarrierAccountCreationEndpoint);
}

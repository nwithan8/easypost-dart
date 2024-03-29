import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDhlExpressCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "country"])
  String? country;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "is_reseller"])
  String? isReseller;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "site_id"])
  String? siteId;

  AddDhlExpressCarrierAccount()
      : super(CarrierAccountType.dhlExpress,
            defaultCarrierAccountCreationEndpoint);
}

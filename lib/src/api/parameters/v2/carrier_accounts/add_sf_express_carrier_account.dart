import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddSFExpressCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "checkword"])
  String? checkword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_code"])
  String? customerCode;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_id"])
  String? customerId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "checkword"])
  String? testCheckword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "customer_code"])
  String? testCustomerCode;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "customer_id"])
  String? testCustomerId;

  AddSFExpressCarrierAccount()
      : super(CarrierAccountType.sFExpress,
            defaultCarrierAccountCreationEndpoint);
}

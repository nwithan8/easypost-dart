import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddCanadaPostCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "api_key"])
  String? apiKey;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "contract_id"])
  String? contractId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_number"])
  String? customerNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "has_credit_card"])
  String? hasCreditCard;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "not_platform"])
  String? notPlatform;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "api_key"])
  String? testApiKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "contract_id"])
  String? testContractId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "customer_number"])
  String? testCustomerNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "has_credit_card"])
  String? testHasCreditCard;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "not_platform"])
  String? testNotPlatform;

  AddCanadaPostCarrierAccount()
      : super(CarrierAccountType.canadaPost,
            defaultCarrierAccountCreationEndpoint);
}

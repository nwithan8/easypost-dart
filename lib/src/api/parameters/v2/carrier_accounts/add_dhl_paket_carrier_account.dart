import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDhlPaketCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "cig_password"])
  String? cigPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "cig_username"])
  String? cigUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "contract_id"])
  String? contractId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "retoure_password"])
  String? retourePassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "retoure_username"])
  String? retoureUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "tnt_password"])
  String? tntPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "tnt_username"])
  String? tntUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "cig_password"])
  String? testCigPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "cig_username"])
  String? testCigUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "contract_id"])
  String? testContractId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "retoure_password"])
  String? testRetourePassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "retoure_username"])
  String? testRetoureUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "tnt_password"])
  String? testTntPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "tnt_username"])
  String? testTntUsername;

  AddDhlPaketCarrierAccount()
      : super(CarrierAccountType.dhlPaket,
            defaultCarrierAccountCreationEndpoint);
}

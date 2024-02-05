import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateDhlEcommerceAsiaCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "barcode_prefix"])
  String? barcodePrefix;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "account_number"])
  String? testAccountNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "barcode_prefix"])
  String? testBarcodePrefix;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "client_id"])
  String? testClientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  CreateDhlEcommerceAsiaCarrierAccount()
      : super(CarrierAccountType.dhlEcommerceAsia,
            defaultCarrierAccountCreationEndpoint);
}

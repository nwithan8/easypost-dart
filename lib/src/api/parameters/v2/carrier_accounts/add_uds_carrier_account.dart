import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddUdsCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "ftp_password"])
  String? ftpPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "ftp_username"])
  String? ftpUsername;

  AddUdsCarrierAccount()
      : super(CarrierAccountType.uds, defaultCarrierAccountCreationEndpoint);
}

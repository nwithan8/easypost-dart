import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddRoyalMailCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "posting_location_number"])
  String? postingLocationNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  AddRoyalMailCarrierAccount()
      : super(CarrierAccountType.royalMail,
            defaultCarrierAccountCreationEndpoint);
}

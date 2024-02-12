import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddApcCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "facility"])
  String? facility;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "shipper_id"])
  String? shipperId;

  AddApcCarrierAccount() : super(CarrierAccountType.apc, defaultCarrierAccountCreationEndpoint);
}

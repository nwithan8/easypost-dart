import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddAmazonMwsCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "access_key_id"])
  String? accessKeyId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "merchant_id"])
  String? merchantId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "secret_key"])
  String? secretKey;

  AddAmazonMwsCarrierAccount() : super(CarrierAccountType.amazonMws, defaultCarrierAccountCreationEndpoint);
}

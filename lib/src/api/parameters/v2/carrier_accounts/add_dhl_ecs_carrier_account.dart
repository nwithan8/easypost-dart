import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddDhlEcsCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_secret"])
  String? clientSecret;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "distribution_center"])
  String? distributionCenter;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "pickup_id"])
  String? pickupId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "client_id"])
  String? testClientId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "client_secret"])
  String? testClientSecret;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "distribution_center"])
  String? testDistributionCenter;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "pickup_id"])
  String? testPickupId;

  AddDhlEcsCarrierAccount()
      : super(CarrierAccountType.dhlEcs, defaultCarrierAccountCreationEndpoint);
}

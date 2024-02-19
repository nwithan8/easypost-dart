import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddNewgisticsCarrierAccount extends AddCarrierAccount {
  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "client_facility_id"])
  String? clientFacilityId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_secret"])
  String? clientSecret;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "fulfiller_facility_id"])
  String? fulfillerFacilityId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "merchant_id"])
  String? merchantId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "tracking_api_key"])
  String? trackingApiKey;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "client_facility_id"])
  String? testClientFacilityId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "test_credentials", "client_id"])
  String? testClientId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "client_secret"])
  String? testClientSecret;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "fulfiller_facility_id"])
  String? testFulfillerFacilityId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "merchant_id"])
  String? testMerchantId;

  @JsonParameter(Necessity.required,
      ['carrier_account', "test_credentials", "tracking_api_key"])
  String? testTrackingApiKey;

  AddNewgisticsCarrierAccount()
      : super(CarrierAccountType.newgistics,
            defaultCarrierAccountCreationEndpoint);
}

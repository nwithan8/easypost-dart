import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateEstafetaCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "client_id"])
  String? clientId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_id"])
  String? customerId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_number"])
  String? customerNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "hub_id"])
  String? hubId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "password"])
  String? password;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "username"])
  String? username;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "credentials", "secret_key"])
  String? secretKey;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "credentials", "user_id"])
  String? userId;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "client_id"])
  String? testClientId;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "test_credentials", "customer_id"])
  String? testCustomerId;

  @JsonParameter(Necessity.optional,
      ['carrier_account', "test_credentials", "customer_number"])
  String? testCustomerNumber;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "hub_id"])
  String? testHubId;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "password"])
  String? testPassword;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "username"])
  String? testUsername;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "secret_key"])
  String? testSecretKey;

  @JsonParameter(
      Necessity.optional, ['carrier_account', "test_credentials", "user_id"])
  String? testUserId;

  CreateEstafetaCarrierAccount()
      : super(
            CarrierAccountType.estafeta, defaultCarrierAccountCreationEndpoint);
}

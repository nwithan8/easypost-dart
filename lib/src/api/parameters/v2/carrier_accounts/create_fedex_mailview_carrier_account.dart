import 'package:easypost/src/api/parameters/v2/carrier_accounts/create_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateFedExMailviewCarrierAccount extends CreateCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "customer_id"])
  String? customerId;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "fimspremium"])
  String? fimsPremium;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "fimsstandard"])
  String? fimsStandard;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "mailviewlight"])
  String? mailviewLight;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "mailviewpremium"])
  String? mailviewPremium;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "service_id"])
  String? serviceId;

  CreateFedExMailviewCarrierAccount()
      : super(CarrierAccountType.fedExMailview,
            defaultCarrierAccountCreationEndpoint);
}

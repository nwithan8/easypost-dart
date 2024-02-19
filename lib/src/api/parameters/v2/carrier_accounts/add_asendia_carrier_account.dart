import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddAsendiaCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "company_name"])
  String? companyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "epacket"])
  String? epacket;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "ftp_password"])
  String? ftpPassword;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "ftp_username"])
  String? ftpUsername;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "internationalexpress"])
  String? internationalExpress;

  @JsonParameter(Necessity.required, ['carrier_account', "credentials", "ipa"])
  String? ipa;

  @JsonParameter(Necessity.required, ['carrier_account', "credentials", "isal"])
  String? isal;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "other"])
  String? other;

  @JsonParameter(Necessity.required, ['carrier_account', "credentials", "pmei"])
  String? pmei;

  @JsonParameter(Necessity.required, ['carrier_account', "credentials", "pmi"])
  String? pmi;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "prioritytracked"])
  String? priorityTracked;

  AddAsendiaCarrierAccount()
      : super(
            CarrierAccountType.asendia, defaultCarrierAccountCreationEndpoint);
}

import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddOsmWorldwideCarrierAccount extends AddCarrierAccount {
  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "account_number"])
  String? accountNumber;

  @JsonParameter(Necessity.required,
      ['carrier_account', "credentials", "aws_sftp_username"])
  String? awsSftpUsername;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "company_name"])
  String? companyName;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "facility_code"])
  String? facilityCode;

  @JsonParameter(
      Necessity.required, ['carrier_account', "credentials", "mailer_id"])
  String? mailerId;

  AddOsmWorldwideCarrierAccount()
      : super(CarrierAccountType.osmWorldwide,
            defaultCarrierAccountCreationEndpoint);
}

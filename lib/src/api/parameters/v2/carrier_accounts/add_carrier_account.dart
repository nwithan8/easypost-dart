import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
abstract class AddCarrierAccount extends Parameters
    implements ICarrierAccountParameter {
  @JsonParameter(Necessity.optional, ['carrier_account', "type"])
  final CarrierAccountType type; // Cannot be overridden by end user

  // Not included in the JSON
  final String endpoint; // Cannot be overridden by end user

  AddCarrierAccount(this.type, this.endpoint) : super();
}

String get defaultCarrierAccountCreationEndpoint => 'carrier_accounts';
String get registerCarrierAccountEndpoint => 'carrier_accounts/register';

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/enums/carrier_account_type.dart';

@reflector
class CreateCarrierAccount extends Parameters implements ICarrierAccountParameter {
  @JsonParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @JsonParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @JsonParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "type"])
  CarrierAccountType? type;

  CreateCarrierAccount() : super();

  // TODO: Parameters per carrier account type
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateCarrierAccount extends Parameters {
  @JsonParameter(Necessity.optional, ['carrier_account', "credentials"])
  Map<String, dynamic>? credentials;

  @JsonParameter(Necessity.optional, ['carrier_account', "description"])
  String? description;

  @JsonParameter(Necessity.optional, ['carrier_account', "reference"])
  String? reference;

  @JsonParameter(Necessity.optional, ['carrier_account', "test_credentials"])
  Map<String, dynamic>? testCredentials;

  UpdateCarrierAccount() : super();
}

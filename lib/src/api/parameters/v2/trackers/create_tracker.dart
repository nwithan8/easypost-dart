import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateTracker extends Parameters {
  @JsonParameter(Necessity.optional, ['tracker', 'amount'])
  String? amount;

  @JsonParameter(Necessity.optional, ['tracker', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['options', 'carrier_account'])
  String? carrierAccount;

  @JsonParameter(Necessity.optional, ['options', 'full_test_tracker'])
  bool? fullTestTracker;

  @JsonParameter(Necessity.optional, ['options', 'is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['tracker', 'tracking_code'])
  String? trackingCode;

  CreateTracker() : super();
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/address.dart';

@reflector
class CreateInsurance extends Parameters {
  @JsonParameter(Necessity.optional, ['insurance', 'amount'])
  double? amount;

  @JsonParameter(Necessity.optional, ['insurance', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['insurance', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['insurance', 'to_address'])
  Address? toAddress;

  @JsonParameter(Necessity.optional, ['insurance', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['insurance', 'tracking_code'])
  String? trackingCode;

  CreateInsurance()
      : super();
}
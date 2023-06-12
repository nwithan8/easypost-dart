import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/end_shipper.dart';
import 'package:easypost/src/models/rate.dart';

@reflector
class BuyShipment extends Parameters {
  @JsonParameter(Necessity.optional, ['end_shipper'])
  EndShipper? endShipper;

  @JsonParameter(Necessity.optional, ['insurance'])
  String? insurance;

  @JsonParameter(Necessity.required, ['rate'])
  Rate? rate;

  @JsonParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  BuyShipment()
      : super();
}
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/end_shipper.dart';
import 'package:easypost/src/models/shipment_rate.dart';

@reflector
class BuyShipment extends Parameters {
  @JsonParameter(Necessity.optional, ['end_shipper'])
  EndShipper? endShipper;

  @JsonParameter(Necessity.optional, ['insurance'])
  String? insurance;

  @JsonParameter(Necessity.required, ['rate'])
  ShipmentRate? rate;

  BuyShipment() : super();
}

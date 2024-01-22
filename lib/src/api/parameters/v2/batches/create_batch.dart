import 'package:easypost/easypost.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateBatch extends Parameters implements IBatchParameter {
  @JsonParameter(Necessity.optional, ['shipment', "reference"])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['shipments'])
  List<IShipmentParameter>? shipments;

  CreateBatch() : super();
}

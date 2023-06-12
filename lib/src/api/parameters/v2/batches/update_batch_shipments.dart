import 'package:easypost/src/api/parameters/v2/shipments/create_shipment.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/shipment.dart';

@reflector
class UpdateBatchShipments extends Parameters {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<CreateShipment>? shipmentCreationParameters;

  UpdateBatchShipments()
      : super();
}
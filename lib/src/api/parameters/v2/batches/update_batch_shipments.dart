import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class UpdateBatchShipments extends Parameters {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;  // Shipments have to exist before they can be added to a batch

  UpdateBatchShipments() : super();
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/shipment.dart';

@reflector
class CreateScanForm extends Parameters {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  CreateScanForm()
      : super();
}
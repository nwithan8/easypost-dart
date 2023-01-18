import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class ScanFormsCreate extends Create {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  ScanFormsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ScanFormsAll extends All {
  ScanFormsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/models/shipment.dart';

@reflector
class ScanFormsCreate extends Create {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  ScanFormsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class ScanFormsAll extends All {
  ScanFormsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

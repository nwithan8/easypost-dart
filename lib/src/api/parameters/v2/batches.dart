import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/v2/shipments.dart';
import 'package:easypost/src/enums/file_format.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';

import '../_generic.dart';

@reflector
class BatchesCreate extends Create {
  @JsonParameter(Necessity.optional, ['shipment', "carrier"])
  String? carrier;

  @JsonParameter(Necessity.optional, ['shipment', "carrier_accounts"])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', "service"])
  String? service;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<Shipment>? shipments;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<ShipmentsCreate>? shipmentCreationParameters;

  BatchesCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class BatchesUpdateShipments extends Parameters {
  @JsonParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<ShipmentsCreate>? shipmentCreationParameters;

  BatchesUpdateShipments({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class BatchesCreateDocument extends Parameters {
  @JsonParameter(Necessity.required, ['file_format'])
  FileFormat? fileFormat;

  BatchesCreateDocument({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class BatchesAll extends All {
  BatchesAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

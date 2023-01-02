import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/parameters/shipments.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '_generic.dart';

class BatchesCreate extends Create {
  @RequestParameter(Necessity.optional, ['shipment', "carrier"])
  String? carrier;

  @RequestParameter(Necessity.optional, ['shipment', "carrier_accounts"])
  List<CarrierAccount>? carrierAccounts;

  @RequestParameter(Necessity.optional, ['shipment', "service"])
  String? service;

  @RequestParameter(Necessity.optional, ['batch', "shipments"])
  List<Shipment>? shipments;

  @RequestParameter(Necessity.optional, ['batch', "shipments"])
  List<ShipmentsCreate>? shipmentCreationParameters;

  BatchesCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class BatchesUpdateShipments extends RequestParameters {
  @RequestParameter(Necessity.required, ['shipments'])
  List<Shipment>? shipments;

  @RequestParameter(Necessity.optional, ['batch', "shipments"])
  List<ShipmentsCreate>? shipmentCreationParameters;

  BatchesUpdateShipments({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class BatchesCreateDocument extends RequestParameters {
  @RequestParameter(Necessity.required, ['file_format'])
  String? fileFormat;

  BatchesCreateDocument({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class BatchesAll extends All {
  BatchesAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

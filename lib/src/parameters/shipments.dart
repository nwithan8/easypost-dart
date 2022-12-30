import 'package:easypost/src/models.dart';
import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class ShipmentsCreate extends Create {
  @RequestParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  @RequestParameter(Necessity.optional, ['shipment', 'carrier'])
  String? carrier;

  @RequestParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @RequestParameter(Necessity.optional, ['shipment', 'customs_info'])
  CustomsInfo? customsInfo;

  @RequestParameter(Necessity.optional, ['shipment', 'from_address'])
  Address? fromAddress;

  @RequestParameter(Necessity.optional, ['shipment', 'insurance'])
  double? insurance;

  @RequestParameter(Necessity.optional, ['shipment', 'is_return'])
  bool? isReturn;

  @RequestParameter(Necessity.optional, ['shipment', 'options'])
  Options? options;

  @RequestParameter(Necessity.optional, ['shipment', 'parcel'])
  Parcel? parcel;

  @RequestParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @RequestParameter(Necessity.optional, ['shipment', 'service'])
  String? service;

  @RequestParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  List<TaxIdentifier>? taxIdentifiers;

  @RequestParameter(Necessity.optional, ['shipment', 'to_address'])
  Address? toAddress;

  ShipmentsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsGenerateRates extends RequestParameters {

  // TODO: What are these parameters?

  ShipmentsGenerateRates({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsCreateDocument extends RequestParameters {

  @RequestParameter(Necessity.required, ['file_format'])
  String? fileFormat;

  ShipmentsCreateDocument({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsInsure extends RequestParameters {

  @RequestParameter(Necessity.required, ['amount'])
  double? amount;

  ShipmentsInsure({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsBuy extends RequestParameters {

  @RequestParameter(Necessity.optional, ['end_shipper'])
  EndShipper? endShipper;

  @RequestParameter(Necessity.optional, ['insurance'])
  String? insurance;

  @RequestParameter(Necessity.required, ['rate'])
  Rate? rate;

  @RequestParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  ShipmentsBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsAll extends All {
  ShipmentsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

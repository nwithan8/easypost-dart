import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/models/tax_identifier.dart';
import 'package:easypost/src/models/end_shipper.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class ShipmentsCreate extends Create {
  @JsonParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  @JsonParameter(Necessity.optional, ['shipment', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', 'customs_info'])
  CustomsInfo? customsInfo;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'insurance'])
  double? insurance;

  @JsonParameter(Necessity.optional, ['shipment', 'is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['shipment', 'options'])
  Options? options;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  Parcel? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'service'])
  String? service;

  @JsonParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  List<TaxIdentifier>? taxIdentifiers;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  Address? toAddress;

  ShipmentsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsGenerateRates extends Parameters {

  // TODO: What are these parameters?

  ShipmentsGenerateRates({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsCreateDocument extends Parameters {

  @JsonParameter(Necessity.required, ['file_format'])
  String? fileFormat;

  ShipmentsCreateDocument({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsInsure extends Parameters {

  @JsonParameter(Necessity.required, ['amount'])
  double? amount;

  ShipmentsInsure({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsBuy extends Parameters {

  @JsonParameter(Necessity.optional, ['end_shipper'])
  EndShipper? endShipper;

  @JsonParameter(Necessity.optional, ['insurance'])
  String? insurance;

  @JsonParameter(Necessity.required, ['rate'])
  Rate? rate;

  @JsonParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  ShipmentsBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ShipmentsAll extends All {
  ShipmentsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/models/tax_identifier.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class OneCallBuyShipment extends Parameters implements IShipmentParameter {
  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<ICarrierAccountParameter>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', 'customs_info'])
  ICustomsInfoParameter? customsInfo;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  IAddressParameter? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'insurance'])
  double? insurance;

  @JsonParameter(Necessity.optional, ['shipment', 'is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['shipment', 'options'])
  Options? options;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  IParcelParameter? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  List<ITaxIdentifierParameter>? taxIdentifiers;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  IAddressParameter? toAddress;

  @JsonParameter(Necessity.required, ['shipment', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['shipment', 'service'])
  String? service;

  OneCallBuyShipment() : super();
}

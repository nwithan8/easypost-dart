import 'package:easypost/easypost.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/maps.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/models/tax_identifier.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateShipment extends Parameters implements IShipmentParameter {
  @JsonParameter(Necessity.optional, ['shipment', 'buyer_address'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['buyer_address'])
  IAddressParameter? buyerAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'carrier'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['carrier'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['carrier'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['carrier'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['carrier_accounts'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['carrier_accounts'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['carrier_accounts'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['carrier_accounts'])
  List<String>? carrierAccountIds;

  @JsonParameter(Necessity.optional, ['shipment', 'customs_info'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['customs_info'])
  ICustomsInfoParameter? customsInfo;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['from_address'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['from_address'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['from_address'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['from_address'])
  IAddressParameter? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'insurance'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['insurance'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['insurance'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['insurance'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['insurance'])
  double? insurance;

  @JsonParameter(Necessity.optional, ['shipment', 'is_return'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['is_return'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['is_return'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['is_return'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['shipment', 'options'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['options'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['options'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['options'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['options'])
  Options? options;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['parcel'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['parcel'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['parcel'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['parcel'])
  IParcelParameter? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['reference'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['reference'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['reference'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'return_address'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['return_address'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['return_address'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['return_address'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['return_address'])
  IAddressParameter? returnAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'service'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['service'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['service'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['service'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['service'])
  String? service;

  @JsonParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['tax_identifiers'])
  List<TaxIdentifier>? taxIdentifiers;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['to_address'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['to_address'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['to_address'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['to_address'])
  IAddressParameter? toAddress;

  CreateShipment() : super();
}

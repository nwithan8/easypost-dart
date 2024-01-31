import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/v2/batches/create_batch.dart';
import 'package:easypost/src/api/parameters/v2/orders/create_order.dart';
import 'package:easypost/src/api/parameters/v2/pickups/create_pickup.dart';
import 'package:easypost/src/api/parameters/v2/scan_forms/create_scan_form.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/tax_identifier.dart';

@reflector
class CreateShipment extends Parameters implements IShipmentParameter {
  @JsonParameter(Necessity.optional, ['shipment', 'buyer_address'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['buyer_address'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['buyer_address'])
  IAddressParameter? buyerAddress;

  @JsonParameter(Necessity.required, ['shipment', 'carrier_accounts'])
  @SubJsonParameter(CreateBatch, Necessity.required, ['carrier_accounts'])
  @SubJsonParameter(CreateOrder, Necessity.required, ['carrier_accounts'])
  @SubJsonParameter(CreatePickup, Necessity.required, ['carrier_accounts'])
  @SubJsonParameter(CreateScanForm, Necessity.required, ['carrier_accounts'])
  List<String>? carrierAccountIds;

  @JsonParameter(Necessity.optional, ['shipment', 'customs_info'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['customs_info'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['customs_info'])
  ICustomsInfoParameter? customsInfo;

  @JsonParameter(Necessity.required, ['shipment', 'from_address'])
  @SubJsonParameter(CreateBatch, Necessity.required, ['from_address'])
  @SubJsonParameter(CreateOrder, Necessity.required, ['from_address'])
  @SubJsonParameter(CreatePickup, Necessity.required, ['from_address'])
  @SubJsonParameter(CreateScanForm, Necessity.required, ['from_address'])
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

  @JsonParameter(Necessity.required, ['shipment', 'parcel'])
  @SubJsonParameter(CreateBatch, Necessity.required, ['parcel'])
  @SubJsonParameter(CreateOrder, Necessity.required, ['parcel'])
  @SubJsonParameter(CreatePickup, Necessity.required, ['parcel'])
  @SubJsonParameter(CreateScanForm, Necessity.required, ['parcel'])
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

  @JsonParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  @SubJsonParameter(CreateBatch, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreateOrder, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreatePickup, Necessity.optional, ['tax_identifiers'])
  @SubJsonParameter(CreateScanForm, Necessity.optional, ['tax_identifiers'])
  List<TaxIdentifier>? taxIdentifiers;

  @JsonParameter(Necessity.required, ['shipment', 'to_address'])
  @SubJsonParameter(CreateBatch, Necessity.required, ['to_address'])
  @SubJsonParameter(CreateOrder, Necessity.required, ['to_address'])
  @SubJsonParameter(CreatePickup, Necessity.required, ['to_address'])
  @SubJsonParameter(CreateScanForm, Necessity.required, ['to_address'])
  IAddressParameter? toAddress;

  CreateShipment() : super();
}

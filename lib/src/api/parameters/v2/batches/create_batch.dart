import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/api/parameters/v2/shipments/create_shipment.dart';

@reflector
class CreateBatch extends Parameters {
  @JsonParameter(Necessity.optional, ['shipment', "carrier"])
  String? carrier;

  @JsonParameter(Necessity.optional, ['shipment', "carrier_accounts"])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', "service"])
  String? service;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<Shipment>? shipments;

  @JsonParameter(Necessity.optional, ['batch', "shipments"])
  List<CreateShipment>? shipmentCreationParameters;

  CreateBatch()
      : super();
}
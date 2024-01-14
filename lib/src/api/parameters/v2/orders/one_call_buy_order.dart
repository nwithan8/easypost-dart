import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class OneCallBuyOrder extends Parameters implements IOrderParameter {
  @JsonParameter(Necessity.optional, ['order', 'carrier_accounts'])
  List<ICarrierAccountParameter>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['order', 'from_address'])
  IAddressParameter? fromAddress;

  @JsonParameter(Necessity.optional, ['order', 'to_address'])
  IAddressParameter? toAddress;

  @JsonParameter(Necessity.optional, ['order', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['order', 'shipments'])
  List<Shipment>? shipments;

  @JsonParameter(Necessity.required, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['service'])
  String? service;

  OneCallBuyOrder() : super();
}

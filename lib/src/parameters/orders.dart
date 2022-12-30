
import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../models.dart';

class OrdersCreate extends Create {
  @RequestParameter(Necessity.optional, ['order', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @RequestParameter(Necessity.optional, ['order', 'from_address'])
  Address? fromAddress;

  @RequestParameter(Necessity.optional, ['order', 'to_address'])
  Address? toAddress;

  @RequestParameter(Necessity.optional, ['order', 'reference'])
  String? reference;

  @RequestParameter(Necessity.optional, ['order', 'shipments'])
  List<Shipment>? shipments;

  OrdersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class OrdersBuy extends All {
  @RequestParameter(Necessity.required, ['carrier'])
  String? carrier;

  @RequestParameter(Necessity.required, ['service'])
  String? service;

  OrdersBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}


import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

import '../models.dart';

class OrdersCreate extends Create {
  @JsonParameter(Necessity.optional, ['order', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['order', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['order', 'to_address'])
  Address? toAddress;

  @JsonParameter(Necessity.optional, ['order', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['order', 'shipments'])
  List<Shipment>? shipments;

  OrdersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class OrdersBuy extends All {
  @JsonParameter(Necessity.required, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['service'])
  String? service;

  OrdersBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

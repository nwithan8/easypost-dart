import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';

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

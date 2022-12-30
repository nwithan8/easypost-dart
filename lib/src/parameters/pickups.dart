import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../models.dart';

class PickupsCreate extends Create {
  @RequestParameter(Necessity.optional, ['pickup', 'address'])
  Address? address;

  @RequestParameter(Necessity.optional, ['pickup', 'batch'])
  Batch? batch;

  @RequestParameter(Necessity.optional, ['pickup', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @RequestParameter(Necessity.optional, ['pickup', 'instructions'])
  String? instructions;

  @RequestParameter(Necessity.optional, ['pickup', 'is_account_address'])
  bool? isAccountAddress;

  @RequestParameter(Necessity.optional, ['pickup', 'max_datetime'])
  DateTime? maxDatetime;

  @RequestParameter(Necessity.optional, ['pickup', 'min_datetime'])
  DateTime? minDatetime;

  @RequestParameter(Necessity.optional, ['pickup', 'reference'])
  String? reference;

  @RequestParameter(Necessity.optional, ['pickup', 'shipment'])
  Shipment? shipment;

  PickupsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class PickupsBuy extends All {
  @RequestParameter(Necessity.required, ['carrier'])
  String? carrier;

  @RequestParameter(Necessity.required, ['service'])
  String? service;

  PickupsBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

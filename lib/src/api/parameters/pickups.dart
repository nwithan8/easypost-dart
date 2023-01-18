import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

import '../../models/address.dart';
import '../../models/carrier_account.dart';
import '../../models/batch.dart';
import '../../models/shipment.dart';

class PickupsCreate extends Create {
  @JsonParameter(Necessity.optional, ['pickup', 'address'])
  Address? address;

  @JsonParameter(Necessity.optional, ['pickup', 'batch'])
  Batch? batch;

  @JsonParameter(Necessity.optional, ['pickup', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['pickup', 'instructions'])
  String? instructions;

  @JsonParameter(Necessity.optional, ['pickup', 'is_account_address'])
  bool? isAccountAddress;

  @JsonParameter(Necessity.optional, ['pickup', 'max_datetime'])
  DateTime? maxDatetime;

  @JsonParameter(Necessity.optional, ['pickup', 'min_datetime'])
  DateTime? minDatetime;

  @JsonParameter(Necessity.optional, ['pickup', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['pickup', 'shipment'])
  Shipment? shipment;

  PickupsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class PickupsBuy extends All {
  @JsonParameter(Necessity.required, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['service'])
  String? service;

  PickupsBuy({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class PickupsAll extends All {
  PickupsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/parcel.dart';

@reflector
class RetrieveRates extends Parameters {
  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  Parcel? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'service'])
  String? service;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  Address? toAddress;

  RetrieveRates()
      : super();
}

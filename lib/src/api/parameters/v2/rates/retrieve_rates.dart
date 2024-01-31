import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/options.dart';

@reflector
class RetrieveRates extends Parameters {
  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<String>? carrierAccountIds;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  IAddressParameter? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  IParcelParameter? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'service'])
  String? service;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  IAddressParameter? toAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'options'])
  Options? options;

  RetrieveRates() : super();
}

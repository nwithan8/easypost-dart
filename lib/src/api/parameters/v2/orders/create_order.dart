import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/shipment.dart';

@reflector
class CreateOrder extends Parameters {
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

  CreateOrder()
      : super();
}
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreatePickup extends Parameters implements IPickupParameter {
  @JsonParameter(Necessity.optional, ['pickup', 'address'])
  IAddressParameter? address;

  @JsonParameter(Necessity.optional, ['pickup', 'batch'])
  IBatchParameter? batch;

  @JsonParameter(Necessity.optional, ['pickup', 'carrier_accounts'])
  List<ICarrierAccountParameter>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['pickup', 'instructions'])
  String? instructions;

  @JsonParameter(Necessity.optional, ['pickup', 'is_account_address'])
  bool? isAccountAddress;

  @JsonParameter(Necessity.optional, ['pickup', 'max_datetime'],
      toJson: dateTimeToString)
  DateTime? maxDatetime;

  @JsonParameter(Necessity.optional, ['pickup', 'min_datetime'],
      toJson: dateTimeToString)
  DateTime? minDatetime;

  @JsonParameter(Necessity.optional, ['pickup', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['pickup', 'shipment'])
  Shipment? shipment;

  CreatePickup() : super();
}

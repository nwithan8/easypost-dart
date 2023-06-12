import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/models/tax_identifier.dart';

@reflector
class CreateShipment extends Parameters {
  @JsonParameter(Necessity.optional, ['carbon_offset'])
  bool? carbonOffset;

  @JsonParameter(Necessity.optional, ['shipment', 'carrier_accounts'])
  List<CarrierAccount>? carrierAccounts;

  @JsonParameter(Necessity.optional, ['shipment', 'customs_info'])
  CustomsInfo? customsInfo;

  @JsonParameter(Necessity.optional, ['shipment', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['shipment', 'insurance'])
  double? insurance;

  @JsonParameter(Necessity.optional, ['shipment', 'is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['shipment', 'options'])
  Options? options;

  @JsonParameter(Necessity.optional, ['shipment', 'parcel'])
  Parcel? parcel;

  @JsonParameter(Necessity.optional, ['shipment', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['shipment', 'tax_identifiers'])
  List<TaxIdentifier>? taxIdentifiers;

  @JsonParameter(Necessity.optional, ['shipment', 'to_address'])
  Address? toAddress;

  CreateShipment()
      : super();
}
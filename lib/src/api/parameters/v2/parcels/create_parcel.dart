import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/api/parameters/v2/shipments/create_shipment.dart';
import 'package:easypost/src/api/parameters/v2/rates/retrieve_rates.dart';

@reflector
class CreateParcel extends Parameters implements IParcelParameter {
  @JsonParameter(Necessity.optional, ['parcel', 'height'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['height'])
  @SubJsonParameter(RetrieveRates, Necessity.optional, ['height'])
  double? height;

  @JsonParameter(Necessity.optional, ['parcel', 'length'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['length'])
  @SubJsonParameter(RetrieveRates, Necessity.optional, ['length'])
  double? length;

  @JsonParameter(Necessity.optional, ['parcel', 'width'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['width'])
  @SubJsonParameter(RetrieveRates, Necessity.optional, ['width'])
  double? width;

  @JsonParameter(Necessity.optional, ['parcel', 'weight'])
  @SubJsonParameter(CreateShipment, Necessity.optional, ['weight'])
  @SubJsonParameter(RetrieveRates, Necessity.optional, ['weight'])
  double? weight;

  CreateParcel() : super();
}

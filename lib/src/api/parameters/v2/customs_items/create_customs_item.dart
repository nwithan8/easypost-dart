import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

@reflector
class CreateCustomsItem extends Parameters implements ICustomsItemParameter {
  @JsonParameter(Necessity.required, ['customs_item', 'description'])
  String? description;

  @JsonParameter(Necessity.required, ['customs_item', 'hs_tariff_number'])
  String? hsTariffNumber;

  @JsonParameter(Necessity.required, ['customs_item', 'origin_country'])
  String? originCountry;

  @JsonParameter(Necessity.required, ['customs_item', 'quantity'])
  int? quantity;

  @JsonParameter(Necessity.required, ['customs_item', 'value'])
  double? value;

  @JsonParameter(Necessity.required, ['customs_item', 'weight'])
  double? weight;

  CreateCustomsItem() : super();
}

import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class CustomsItemsCreate extends Create {
  @RequestParameter(Necessity.required, ['customs_item', 'description'])
  String? description;

  @RequestParameter(Necessity.required, ['customs_item', 'hs_tariff_number'])
  String? hsTariffNumber;

  @RequestParameter(Necessity.required, ['customs_item', 'origin_country'])
  String? originCountry;

  @RequestParameter(Necessity.required, ['customs_item', 'quantity'])
  int? quantity;

  @RequestParameter(Necessity.required, ['customs_item', 'value'])
  double? value;

  @RequestParameter(Necessity.required, ['customs_item', 'weight'])
  double? weight;

  CustomsItemsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CustomsItemsAll extends All {
  CustomsItemsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class CustomsItemsCreate extends Create {
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

  CustomsItemsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CustomsItemsAll extends All {
  CustomsItemsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

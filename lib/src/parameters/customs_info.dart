import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

import '../models/customs_item.dart';

class CustomsInfoCreate extends Create {
  @JsonParameter(Necessity.required, ['customs_info', 'contents_explanation'])
  String? contentsExplanation;

  @JsonParameter(Necessity.required, ['customs_info', 'contents_type'])
  String? contentsType;

  @JsonParameter(Necessity.required, ['customs_info', 'customs_certify'])
  bool? customsCertify;

  @JsonParameter(Necessity.required, ['customs_info', 'customs_items'])
  List<CustomsItem>? customsItems;

  @JsonParameter(Necessity.required, ['customs_info', 'customs_signer'])
  String? customsSigner;

  @JsonParameter(Necessity.required, ['customs_info', 'eel_pfc'])
  String? eelPfc;

  @JsonParameter(Necessity.required, ['customs_info', 'non_delivery_option'])
  String? nonDeliveryOption;

  @JsonParameter(Necessity.required, ['customs_info', 'restriction_type'])
  String? restrictionType;

  CustomsInfoCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CustomsInfoAll extends All {
  CustomsInfoAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

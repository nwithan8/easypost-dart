import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../models/customs_item.dart';

class CustomsInfoCreate extends Create {
  @RequestParameter(Necessity.required, ['customs_info', 'contents_explanation'])
  String? contentsExplanation;

  @RequestParameter(Necessity.required, ['customs_info', 'contents_type'])
  String? contentsType;

  @RequestParameter(Necessity.required, ['customs_info', 'customs_certify'])
  bool? customsCertify;

  @RequestParameter(Necessity.required, ['customs_info', 'customs_items'])
  List<CustomsItem>? customsItems;

  @RequestParameter(Necessity.required, ['customs_info', 'customs_signer'])
  String? customsSigner;

  @RequestParameter(Necessity.required, ['customs_info', 'eel_pfc'])
  String? eelPfc;

  @RequestParameter(Necessity.required, ['customs_info', 'non_delivery_option'])
  String? nonDeliveryOption;

  @RequestParameter(Necessity.required, ['customs_info', 'restriction_type'])
  String? restrictionType;

  CustomsInfoCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class CustomsInfoAll extends All {
  CustomsInfoAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

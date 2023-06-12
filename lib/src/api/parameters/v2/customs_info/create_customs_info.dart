import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/customs_item.dart';

@reflector
class CreateCustomsInfo extends Parameters {
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

  CreateCustomsInfo()
      : super();
}
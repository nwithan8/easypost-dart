import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

class RefundsCreate extends Create {
  @JsonParameter(Necessity.required, ['refund', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['refund', 'tracking_codes'])  // yes, the param name is plural when it's really just one code
  String? trackingCode;

  RefundsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class RefundsAll extends All {
  RefundsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

@reflector
class RefundsCreate extends Create {
  @JsonParameter(Necessity.required, ['refund', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, [
    'refund',
    'tracking_codes'
  ]) // yes, the param name is plural when it's really just one code
  String? trackingCode;

  RefundsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class RefundsAll extends All {
  RefundsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

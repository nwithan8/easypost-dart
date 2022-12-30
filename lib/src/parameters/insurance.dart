import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../models.dart';

class InsuranceCreate extends Create {
  @RequestParameter(Necessity.optional, ['insurance', 'amount'])
  double? amount;

  @RequestParameter(Necessity.optional, ['insurance', 'carrier'])
  String? carrier;

  @RequestParameter(Necessity.optional, ['insurance', 'from_address'])
  Address? fromAddress;

  @RequestParameter(Necessity.optional, ['insurance', 'to_address'])
  Address? toAddress;

  @RequestParameter(Necessity.optional, ['insurance', 'reference'])
  String? reference;

  @RequestParameter(Necessity.optional, ['insurance', 'tracking_code'])
  String? trackingCode;

  InsuranceCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class InsuranceAll extends All {
  InsuranceAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

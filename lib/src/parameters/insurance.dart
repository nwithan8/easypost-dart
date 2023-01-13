import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

import '../models.dart';

class InsuranceCreate extends Create {
  @JsonParameter(Necessity.optional, ['insurance', 'amount'])
  double? amount;

  @JsonParameter(Necessity.optional, ['insurance', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['insurance', 'from_address'])
  Address? fromAddress;

  @JsonParameter(Necessity.optional, ['insurance', 'to_address'])
  Address? toAddress;

  @JsonParameter(Necessity.optional, ['insurance', 'reference'])
  String? reference;

  @JsonParameter(Necessity.optional, ['insurance', 'tracking_code'])
  String? trackingCode;

  InsuranceCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class InsuranceAll extends All {
  InsuranceAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

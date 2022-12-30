import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class BillingFund extends RequestParameters {
  @RequestParameter(Necessity.required, ['amount'])
  String? amount;

  BillingFund({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

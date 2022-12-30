import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class ReferralCustomersCreate extends Create {
  @RequestParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @RequestParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @RequestParameter(Necessity.optional, ['user', 'phone'])
  String? phoneNumber;

  ReferralCustomersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ReferralCustomersAll extends All {
  ReferralCustomersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

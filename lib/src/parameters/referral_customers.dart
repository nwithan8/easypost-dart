import 'package:easypost/src/parameters/_base.dart';
import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/parameter_annotation.dart';

class ReferralCustomersCreate extends Create {
  @JsonParameter(Necessity.optional, ['user', 'email'])
  String? email;

  @JsonParameter(Necessity.optional, ['user', 'name'])
  String? name;

  @JsonParameter(Necessity.optional, ['user', 'phone'])
  String? phoneNumber;

  ReferralCustomersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ReferralCustomersAll extends All {
  ReferralCustomersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ReferralCustomersAddCreditCard extends Parameters {
  @Parameter(Necessity.required)
  int? creditCardNumber;

  @Parameter(Necessity.required)
  int? creditCardExpirationMonth;

  @Parameter(Necessity.required)
  int? creditCardExpirationYear;

  @Parameter(Necessity.required)
  int? creditCardCvv;

  ReferralCustomersAddCreditCard()
      : super();
}

class ReferralCustomersUpdateEmail extends Parameters {
  @Parameter(Necessity.required)
  String? email;

  ReferralCustomersUpdateEmail()
      : super();
}

import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

@reflector
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

@reflector
class ReferralCustomersAll extends All {
  ReferralCustomersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class ReferralCustomersAddCreditCard extends Parameters {
  @Parameter(Necessity.required)
  int? creditCardNumber;

  @Parameter(Necessity.required)
  int? creditCardExpirationMonth;

  @Parameter(Necessity.required)
  int? creditCardExpirationYear;

  @Parameter(Necessity.required)
  int? creditCardCvv;

  ReferralCustomersAddCreditCard() : super();
}

@reflector
class ReferralCustomersUpdateEmail extends Parameters {
  @Parameter(Necessity.required)
  String? email;

  ReferralCustomersUpdateEmail() : super();
}

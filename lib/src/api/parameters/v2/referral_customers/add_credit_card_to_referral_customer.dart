import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class AddCreditCardToReferralCustomer extends Parameters {
  @Parameter(Necessity.required)
  int? creditCardNumber;

  @Parameter(Necessity.required)
  int? creditCardExpirationMonth;

  @Parameter(Necessity.required)
  int? creditCardExpirationYear;

  @Parameter(Necessity.required)
  int? creditCardCvv;

  AddCreditCardToReferralCustomer() : super();
}
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';

@reflector
class AddPlaidBankAccount extends Parameters {
  @JsonParameter(Necessity.required, ['bank_account', 'account_id'])
  String? accountId;

  @JsonParameter(Necessity.required, ['payment_method', 'public_token'])
  String? publicToken;

  @JsonParameter(Necessity.required, ['payment_method', 'priority'])
  PaymentMethodPriority? priority = PaymentMethodPriority.primary;

  AddPlaidBankAccount() : super();
}

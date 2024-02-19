import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/enums/payment_method_priority.dart';

@reflector
class AddBankAccount extends Parameters {
  @JsonParameter(Necessity.required, ['bank_account', 'account_holder_name'])
  String? accountHolderName;

  @JsonParameter(Necessity.required, ['payment_method', 'account_holder_type'])
  String? accountHolderType;

  @JsonParameter(Necessity.required, ['bank_account', 'account_number'])
  String? accountNumber;

  @JsonParameter(Necessity.required, ['bank_account', 'routing_number'])
  String? routingNumber;

  @JsonParameter(Necessity.optional, ['bank_account', 'country'])
  String? countryCode;

  @JsonParameter(Necessity.required, ['payment_method', 'priority'])
  PaymentMethodPriority? priority = PaymentMethodPriority.primary;

  AddBankAccount() : super();
}

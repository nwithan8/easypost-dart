import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/models/payment_method.dart';
import 'package:easypost/src/common/models/payment_method_priority.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_methods_summary.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentMethodsSummary extends Model {
  @JsonKey(name: 'primary_payment_method')
  final PaymentMethod? primaryPaymentMethod;

  @JsonKey(name: 'secondary_payment_method')
  final PaymentMethod? secondaryPaymentMethod;

  PaymentMethodsSummary(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.primaryPaymentMethod,
    this.secondaryPaymentMethod,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory PaymentMethodsSummary.fromJson(Map<String, dynamic> input) =>
      _$PaymentMethodsSummaryFromJson(input);

  Map<String, dynamic> toJson() => _$PaymentMethodsSummaryToJson(this);

  PaymentMethod? byPriority(PaymentMethodPriority priority) {
    switch (priority) {
      case PaymentMethodPriority.primary:
        return primaryPaymentMethod;
      case PaymentMethodPriority.secondary:
        return secondaryPaymentMethod;
    }
  }
}

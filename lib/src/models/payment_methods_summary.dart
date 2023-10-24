import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/payment_method.dart';
import 'package:easypost/src/models/payment_method_priority.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_methods_summary.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentMethodsSummary extends ModelWithId {
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

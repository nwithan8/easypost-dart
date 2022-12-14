import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/error.dart';
import 'package:json_annotation/json_annotation.dart';

import '../utilities/conversions.dart';

part 'payment_refund.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentRefund extends Model {
  @JsonKey(name: 'refunded_amount')
  final int? refundedAmount;

  @JsonKey(name: 'refunded_amount_currencys')
  final String? refundCurrency;

  @JsonKey(name: 'refunded_payment_logs')
  final List<String>? refundedPaymentLogsIds;

  @JsonKey(name: 'payment_log_id')
  final String? paymentLogId;

  @JsonKey(name: 'errors')
  final List<Error>? errors;

  PaymentRefund(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      this.refundedAmount,
      this.refundCurrency,
      this.refundedPaymentLogsIds,
      this.paymentLogId,
      this.errors,
      ) : super(id, createdAt, updatedAt, objectType, mode);

  factory PaymentRefund.fromJson(Map<String, dynamic> input) =>
      _$PaymentRefundFromJson(input);

  Map<String, dynamic> toJson() => _$PaymentRefundToJson(this);
}

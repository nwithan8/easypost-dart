import 'package:easypost/src/api/parameters/v2/billing/list_payment_logs.dart';
import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/enums/payment_log_charge_type.dart';
import 'package:easypost/src/enums/payment_log_source_type.dart';
import 'package:easypost/src/enums/payment_log_status.dart';
import 'package:easypost/src/enums/payment_log_target_type.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_log.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentLog extends ModelWithId {
  @JsonKey(name: 'amount', fromJson: stringToMoney, toJson: moneyToString)
  final double? amount;

  @JsonKey(name: 'details')
  final String? details;

  @JsonKey(name: 'source_id')
  final String? sourceId;

  @JsonKey(name: 'target_id')
  final String? targetId;

  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  @JsonKey(name: 'user_id')
  final String? userId;

  @JsonKey(name: 'amount_subunits')
  final String? amountSubunits;

  @JsonKey(name: 'amount_currency')
  final String? amountCurrency;

  @JsonKey(name: 'balance_subunits')
  final String? balanceSubunits;

  @JsonKey(name: 'balance_currency')
  final String? balanceCurrency;

  @JsonKey(
      name: 'charge_type',
      fromJson: PaymentLogChargeType.fromString,
      toJson: PaymentLogChargeType.asString)
  final PaymentLogChargeType? chargeType;

  @JsonKey(name: 'is_debit')
  final bool? isDebit;

  @JsonKey(
      name: 'previous_balance', fromJson: stringToMoney, toJson: moneyToString)
  final double? previousBalance;

  @JsonKey(
      name: 'status',
      fromJson: PaymentLogStatus.fromString,
      toJson: PaymentLogStatus.asString)
  final PaymentLogStatus? status;

  @JsonKey(
      name: 'source_type',
      fromJson: PaymentLogSourceType.fromString,
      toJson: PaymentLogSourceType.asString)
  final PaymentLogSourceType? sourceType;

  @JsonKey(
      name: 'target_type',
      fromJson: PaymentLogTargetType.fromString,
      toJson: PaymentLogTargetType.asString)
  final PaymentLogTargetType? targetType;

  PaymentLog(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      this.status,
      this.amount,
      this.details,
      this.sourceId,
      this.targetId,
      this.transactionId,
      this.userId,
      this.amountSubunits,
      this.amountCurrency,
      this.balanceSubunits,
      this.balanceCurrency,
      this.chargeType,
      this.isDebit,
      this.previousBalance,
      this.sourceType,
      this.targetType)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory PaymentLog.fromJson(Map<String, dynamic> input) =>
      _$PaymentLogFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PaymentLogToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentLogCollection
    extends PaginatedCollection<PaymentLog, ListPaymentLogs> {
  @JsonKey(name: 'payment_logs')
  final List<PaymentLog>? paymentLogs;

  PaymentLogCollection(
      objectType, mode, hasMore, this.paymentLogs)
      : super(objectType, mode, hasMore);

  factory PaymentLogCollection.fromJson(Map<String, dynamic> input) =>
      _$PaymentLogCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PaymentLogCollectionToJson(this);

  @override
  ListPaymentLogs buildGetNextPageParameters(List<PaymentLog>? currentPageItems, {int? pageSize}) {
    ListPaymentLogs parameters = filters ?? ListPaymentLogs();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

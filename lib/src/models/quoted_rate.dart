import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quoted_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class QuotedRate extends Model {
  @JsonKey(name: 'billing_type')
  final String? billingType;

  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'carrier_account_id')
  final String? carrierAccountId;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;

  @JsonKey(name: 'delivery_date_guaranteed')
  final bool? deliveryDateIsGuaranteed;

  @JsonKey(name: 'delivery_days')
  final int? deliveryDays;

  @JsonKey(name: 'est_delivery_days')
  final int? estDeliveryDays;

  @JsonKey(name: 'list_currency')
  final String? listCurrency;

  @JsonKey(name: 'list_rate', fromJson: stringToMoney, toJson: moneyToString)
  final double? listRate;

  @JsonKey(name: 'rate', fromJson: stringToMoney, toJson: moneyToString)
  final double? price;

  @JsonKey(name: 'retail_currency')
  final String? retailCurrency;

  @JsonKey(name: 'retail_rate', fromJson: stringToMoney, toJson: moneyToString)
  final double? retailRate;

  @JsonKey(name: 'service')
  final String? service;

  QuotedRate(
    objectType,
    mode,
    this.billingType,
    this.carrier,
    this.carrierAccountId,
    this.currency,
    this.deliveryDate,
    this.deliveryDateIsGuaranteed,
    this.deliveryDays,
    this.estDeliveryDays,
    this.listCurrency,
    this.listRate,
    this.price,
    this.retailCurrency,
    this.retailRate,
    this.service,
  ) : super(objectType, mode);

  factory QuotedRate.fromJson(Map<String, dynamic> input) => _$QuotedRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$QuotedRateToJson(this);
}

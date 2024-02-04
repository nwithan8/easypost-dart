import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

@JsonSerializable(explicitToJson: true)
class Rate extends ModelWithId { // Still need to have ID until can buy a shipment with a "stateless" rate
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

  @JsonKey(name: 'shipment_id')
  final String? shipmentId;

  Rate(
    id,
    createdAt,
    updatedAt,
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
    this.shipmentId,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Rate.fromJson(Map<String, dynamic> input) => _$RateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$RateToJson(this);
}

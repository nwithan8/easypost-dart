import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/carbon_offset.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate.g.dart';

@JsonSerializable(explicitToJson: true)
class Rate extends Model {
  @JsonKey(name: 'billing_type')
  final String? billingType;

  @JsonKey(name: 'carbon_offset')
  final CarbonOffset? carbonOffset;

  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'carrier_account_id')
  final String? carrierAccountId;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'delivery_date')
  final DateTime? deliveryDate;

  @JsonKey(name: 'delivery_date_guaranteed')
  final bool? deliveryDateGuaranteed;

  @JsonKey(name: 'delivery_days')
  final int? deliveryDays;

  @JsonKey(name: 'est_delivery_days')
  final int? estDeliveryDays;

  @JsonKey(name: 'list_currency')
  final String? listCurrency;

  @JsonKey(name: 'list_rate', fromJson: stringToMoney, toJson: moneyToString)
  final double? listRate;

  @JsonKey(name: 'rate', fromJson: stringToMoney, toJson: moneyToString)
  final double? rate;

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
    this.carbonOffset,
    this.carrier,
    this.carrierAccountId,
    this.currency,
    this.deliveryDate,
    this.deliveryDateGuaranteed,
    this.deliveryDays,
    this.estDeliveryDays,
    this.listCurrency,
    this.listRate,
    this.rate,
    this.retailCurrency,
    this.retailRate,
    this.service,
    this.shipmentId,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Rate.fromJson(Map<String, dynamic> input) => _$RateFromJson(input);

  Map<String, dynamic> toJson() => _$RateToJson(this);
}

import 'package:easypost/src/models/quoted_rate.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easypost/src/internal/conversions.dart';

part 'shipment_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class ShipmentRate extends QuotedRate {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'shipment_id')
  final String? shipmentId;

  ShipmentRate(
    objectType,
    mode,
    billingType,
    carrier,
    carrierAccountId,
    currency,
    deliveryDate,
    deliveryDateIsGuaranteed,
    deliveryDays,
    estDeliveryDays,
    listCurrency,
    listRate,
    price,
    retailCurrency,
    retailRate,
    service,
    this.id,
    this.shipmentId,
  ) : super(
          objectType,
          mode,
          billingType,
          carrier,
          carrierAccountId,
          currency,
          deliveryDate,
          deliveryDateIsGuaranteed,
          deliveryDays,
          estDeliveryDays,
          listCurrency,
          listRate,
          price,
          retailCurrency,
          retailRate,
          service,
        );

  factory ShipmentRate.fromJson(Map<String, dynamic> input) =>
      _$ShipmentRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ShipmentRateToJson(this);
}

import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/shipment_rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class OrderRate extends ShipmentRate {
  OrderRate(
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
    id,
    shipmentId,
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
          id,
          shipmentId,
        );

  factory OrderRate.fromJson(Map<String, dynamic> input) =>
      _$OrderRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$OrderRateToJson(this);
}

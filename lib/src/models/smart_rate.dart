import 'package:easypost/src/models/shipment_rate.dart';
import 'package:easypost/src/models/time_in_transit.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class SmartRate extends ShipmentRate {
  @JsonKey(name: 'time_in_transit')
  final TimeInTransit? timeInTransit;

  SmartRate(
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
    this.timeInTransit,
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

  factory SmartRate.fromJson(Map<String, dynamic> input) =>
      _$SmartRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$SmartRateToJson(this);
}

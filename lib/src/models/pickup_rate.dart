import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pickup_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class PickupRate extends Rate {
  @JsonKey(name: 'pickup_id')
  final String? pickupId;

  PickupRate(
    id,
    createdAt,
    updatedAt,
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
    shipmentId,
    this.pickupId,
  ) : super(
          id,
          createdAt,
          updatedAt,
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
          shipmentId,
        );

  factory PickupRate.fromJson(Map<String, dynamic> input) =>
      _$PickupRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PickupRateToJson(this);
}

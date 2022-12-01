import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/utilities.dart';
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
    carbonOffset,
    carrier,
    carrierAccountId,
    currency,
    deliveryDate,
    deliveryDateGuaranteed,
    deliveryDays,
    estDeliveryDays,
    listCurrency,
    listRate,
    rate,
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
          carbonOffset,
          carrier,
          carrierAccountId,
          currency,
          deliveryDate,
          deliveryDateGuaranteed,
          deliveryDays,
          estDeliveryDays,
          listCurrency,
          listRate,
          rate,
          retailCurrency,
          retailRate,
          service,
          shipmentId,
        );

  factory PickupRate.fromJson(Map<String, dynamic> input) =>
      _$PickupRateFromJson(input);

  Map<String, dynamic> toJson() => _$PickupRateToJson(this);
}

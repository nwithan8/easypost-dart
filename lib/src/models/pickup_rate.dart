import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pickup_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class PickupRate extends QuotedRate {
  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'pickup_id')
  final String? pickupId;

  PickupRate(
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
    this.pickupId,
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

  factory PickupRate.fromJson(Map<String, dynamic> input) =>
      _$PickupRateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PickupRateToJson(this);
}

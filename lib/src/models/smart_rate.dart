import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/models/time_in_transit.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'smart_rate.g.dart';

@JsonSerializable(explicitToJson: true)
class SmartRate extends Rate {
  @JsonKey(name: 'time_in_transit')
  final TimeInTransit? timeInTransit;

  SmartRate(
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
    this.timeInTransit,
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

  factory SmartRate.fromJson(Map<String, dynamic> input) =>
      _$SmartRateFromJson(input);

  Map<String, dynamic> toJson() => _$SmartRateToJson(this);
}

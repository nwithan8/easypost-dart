import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/smart_rate.dart';
import 'package:easypost/src/models/time_in_transit_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rate_with_estimated_delivery_date.g.dart';

@JsonSerializable(explicitToJson: true)
class RateWithEstimatedDeliveryDate extends Model {
  @JsonKey(name: 'rate')
  final SmartRate smartRate;

  @JsonKey(name: 'easypost_time_in_transit_data')
  final TimeInTransitDetails? details;

  RateWithEstimatedDeliveryDate(
    this.smartRate,
    this.details,
  ) : super();

  factory RateWithEstimatedDeliveryDate.fromJson(Map<String, dynamic> input) =>
      _$RateWithEstimatedDeliveryDateFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$RateWithEstimatedDeliveryDateToJson(this);
}

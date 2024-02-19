import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/time_in_transit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_in_transit_details.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeInTransitDetails extends Model {
  @JsonKey(name: 'days_in_transit')
  final TimeInTransit? daysInTransit;

  @JsonKey(
      name: 'easypost_estimated_delivery_date',
      fromJson: stringToDateTime,
      toJson: dateTimeToStringYYYYMMDD)
  final DateTime? estimatedDeliveryDate;

  @JsonKey(
      name: 'planned_ship_date',
      fromJson: stringToDateTime,
      toJson: dateTimeToStringYYYYMMDD)
  final DateTime? plannedShipDate;

  TimeInTransitDetails(
    this.daysInTransit,
    this.estimatedDeliveryDate,
    this.plannedShipDate,
  ) : super();

  factory TimeInTransitDetails.fromJson(Map<String, dynamic> input) =>
      _$TimeInTransitDetailsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$TimeInTransitDetailsToJson(this);
}

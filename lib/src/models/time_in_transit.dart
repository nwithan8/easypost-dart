import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/enums/smart_rate_accuracy.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_in_transit.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeInTransit extends Model {
  @JsonKey(name: 'percentile_50')
  final int? percentile50;

  @JsonKey(name: 'percentile_75')
  final int? percentile75;

  @JsonKey(name: 'percentile_85')
  final int? percentile85;

  @JsonKey(name: 'percentile_90')
  final int? percentile90;

  @JsonKey(name: 'percentile_95')
  final int? percentile95;

  @JsonKey(name: 'percentile_97')
  final int? percentile97;

  @JsonKey(name: 'percentile_99')
  final int? percentile99;

  TimeInTransit(
    this.percentile50,
    this.percentile75,
    this.percentile85,
    this.percentile90,
    this.percentile95,
    this.percentile97,
    this.percentile99,
  ) : super();

  factory TimeInTransit.fromJson(Map<String, dynamic> input) =>
      _$TimeInTransitFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$TimeInTransitToJson(this);

  int? bySmartRateAccuracy(SmartRateAccuracy accuracy) {
    if (accuracy.matches(SmartRateAccuracy.percentile50)) {
      return percentile50;
    } else if (accuracy.matches(SmartRateAccuracy.percentile75)) {
      return percentile75;
    } else if (accuracy.matches(SmartRateAccuracy.percentile85)) {
      return percentile85;
    } else if (accuracy.matches(SmartRateAccuracy.percentile90)) {
      return percentile90;
    } else if (accuracy.matches(SmartRateAccuracy.percentile95)) {
      return percentile95;
    } else if (accuracy.matches(SmartRateAccuracy.percentile97)) {
      return percentile97;
    } else if (accuracy.matches(SmartRateAccuracy.percentile99)) {
      return percentile99;
    }
    return null;
  }
}

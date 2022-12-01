import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/smart_rate_accuracy.dart';
import 'package:easypost/src/utilities.dart';
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
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.percentile50,
    this.percentile75,
    this.percentile85,
    this.percentile90,
    this.percentile95,
    this.percentile97,
    this.percentile99,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory TimeInTransit.fromJson(Map<String, dynamic> input) =>
      _$TimeInTransitFromJson(input);

  Map<String, dynamic> toJson() => _$TimeInTransitToJson(this);

  int? bySmartRateAccuracy(SmartRateAccuracy accuracy) {
    switch (accuracy) {
      case SmartRateAccuracy.percentile50:
        return percentile50;
      case SmartRateAccuracy.percentile75:
        return percentile75;
      case SmartRateAccuracy.percentile85:
        return percentile85;
      case SmartRateAccuracy.percentile90:
        return percentile90;
      case SmartRateAccuracy.percentile95:
        return percentile95;
      case SmartRateAccuracy.percentile97:
        return percentile97;
      case SmartRateAccuracy.percentile99:
        return percentile99;
    }
  }
}

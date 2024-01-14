import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_info_service_level.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfoServiceLevel extends Model {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'dimensions')
  final List<String>? dimensions;

  @JsonKey(name: 'human_readable')
  final String? humanReadable;

  @JsonKey(name: 'max_weight')
  final String? maxWeight;

  @JsonKey(name: 'name')
  final String? name;

  CarrierInfoServiceLevel(objectType, mode, this.carrier, this.description,
      this.dimensions, this.humanReadable, this.maxWeight, this.name)
      : super(objectType, mode);

  factory CarrierInfoServiceLevel.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoServiceLevelFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierInfoServiceLevelToJson(this);
}

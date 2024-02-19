import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_info_supported_feature.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfoSupportedFeature extends ReadOnlyModel {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'supported')
  final bool? supported;

  CarrierInfoSupportedFeature(objectType, mode, this.carrier, this.description,
      this.name, this.supported)
      : super(objectType, mode);

  factory CarrierInfoSupportedFeature.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoSupportedFeatureFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierInfoSupportedFeatureToJson(this);
}

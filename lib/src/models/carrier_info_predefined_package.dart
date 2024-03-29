import 'package:easypost/src/base/readonly_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_info_predefined_package.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfoPredefinedPackage extends ReadOnlyModel {
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

  CarrierInfoPredefinedPackage(objectType, mode, this.carrier, this.description,
      this.dimensions, this.humanReadable, this.maxWeight, this.name)
      : super(objectType, mode);

  factory CarrierInfoPredefinedPackage.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoPredefinedPackageFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierInfoPredefinedPackageToJson(this);
}

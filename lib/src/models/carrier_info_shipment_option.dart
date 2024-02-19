import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_info_shipment_option.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfoShipmentOption extends ReadOnlyModel {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'deprecated')
  final bool? deprecated;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'human_readable')
  final String? humanReadable;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'type')
  final String? type;

  CarrierInfoShipmentOption(objectType, mode, this.carrier, this.deprecated,
      this.description, this.humanReadable, this.name, this.type)
      : super(objectType, mode);

  factory CarrierInfoShipmentOption.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoShipmentOptionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierInfoShipmentOptionToJson(this);
}

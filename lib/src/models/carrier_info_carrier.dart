import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easypost/src/models/carrier_info_predefined_package.dart';
import 'package:easypost/src/models/carrier_info_service_level.dart';
import 'package:easypost/src/models/carrier_info_shipment_option.dart';
import 'package:easypost/src/models/carrier_info_supported_feature.dart';

part 'carrier_info_carrier.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierInfoCarrier extends Model {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'human_readable')
  final String? humanReadable;

  @JsonKey(name: 'predefined_packages')
  final List<CarrierInfoPredefinedPackage>? predefinedPackages;

  @JsonKey(name: 'service_levels')
  final List<CarrierInfoServiceLevel>? serviceLevels;

  @JsonKey(name: 'shipment_options')
  final List<CarrierInfoShipmentOption>? shipmentOptions;

  @JsonKey(name: 'supported_features')
  final List<CarrierInfoSupportedFeature>? supportedFeatures;

  CarrierInfoCarrier(
      objectType,
      mode,
      this.name,
      this.humanReadable,
      this.predefinedPackages,
      this.serviceLevels,
      this.shipmentOptions,
      this.supportedFeatures)
      : super(objectType, mode);

  factory CarrierInfoCarrier.fromJson(Map<String, dynamic> input) =>
      _$CarrierInfoCarrierFromJson(input);

  Map<String, dynamic> toJson() => _$CarrierInfoCarrierToJson(this);

  /// Returns whether or not the carrier supports the given feature.
  bool isFeatureSupported(String featureName) {
    if (supportedFeatures == null) {
      return false;
    }
    for (var feature in supportedFeatures!) {
      if (feature.name == featureName) {
        return feature.supported ?? false;
      }
    }
    return false;
  }

  /// Returns whether or not the carrier supports the given service level.
  bool isServiceLevelSupported(String serviceLevelName) {
    if (serviceLevels == null) {
      return false;
    }
    for (var serviceLevel in serviceLevels!) {
      if (serviceLevel.name == serviceLevelName) {
        return true;
      }
    }
    return false;
  }

  /// Returns whether or not the carrier supports the given shipment option.
  bool isShipmentOptionSupported(String shipmentOptionName) {
    if (shipmentOptions == null) {
      return false;
    }
    for (var shipmentOption in shipmentOptions!) {
      if (shipmentOption.name == shipmentOptionName) {
        return true;
      }
    }
    return false;
  }

  /// Returns whether or not the carrier supports the given predefined package.
  bool isPredefinedPackageSupported(String predefinedPackageName) {
    if (predefinedPackages == null) {
      return false;
    }
    for (var predefinedPackage in predefinedPackages!) {
      if (predefinedPackage.name == predefinedPackageName) {
        return true;
      }
    }
    return false;
  }
}

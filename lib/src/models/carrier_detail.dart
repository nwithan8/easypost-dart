import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierDetail extends ReadOnlyModel {
  @JsonKey(name: 'alternate_identifier')
  final String? alternateIdentifier;

  @JsonKey(name: 'container_type')
  final String? containerType;

  @JsonKey(name: 'destination_location')
  final String? destinationLocation;

  @JsonKey(
      name: 'est_delivery_date_local',
      fromJson: stringToDateTime,
      toJson: dateTimeToString)
  final DateTime? estDeliveryDateLocal;

  @JsonKey(
      name: 'guaranteed_delivery_date',
      fromJson: stringToDateTime,
      toJson: dateTimeToString)
  final DateTime? guaranteedDeliveryDate;

  @JsonKey(
      name: 'initial_delivery_attempt',
      fromJson: stringToDateTime,
      toJson: dateTimeToString)
  final DateTime? initialDeliveryAttempt;

  @JsonKey(name: 'origin_location')
  final String? originLocation;

  @JsonKey(name: 'service')
  final String? service;

  CarrierDetail(
    objectType,
    mode,
    this.alternateIdentifier,
    this.containerType,
    this.destinationLocation,
    this.estDeliveryDateLocal,
    this.guaranteedDeliveryDate,
    this.initialDeliveryAttempt,
    this.originLocation,
    this.service,
  ) : super(objectType, mode);

  factory CarrierDetail.fromJson(Map<String, dynamic> input) =>
      _$CarrierDetailFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierDetailToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_with_estimated_delivery_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateWithEstimatedDeliveryDate _$RateWithEstimatedDeliveryDateFromJson(
        Map<String, dynamic> json) =>
    RateWithEstimatedDeliveryDate(
      SmartRate.fromJson(json['rate'] as Map<String, dynamic>),
      json['easypost_time_in_transit_data'] == null
          ? null
          : TimeInTransitDetails.fromJson(
              json['easypost_time_in_transit_data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateWithEstimatedDeliveryDateToJson(
        RateWithEstimatedDeliveryDate instance) =>
    <String, dynamic>{
      'rate': instance.smartRate.toJson(),
      'easypost_time_in_transit_data': instance.details?.toJson(),
    };

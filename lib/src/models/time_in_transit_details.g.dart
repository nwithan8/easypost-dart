// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_in_transit_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInTransitDetails _$TimeInTransitDetailsFromJson(
        Map<String, dynamic> json) =>
    TimeInTransitDetails(
      json['days_in_transit'] == null
          ? null
          : TimeInTransit.fromJson(
              json['days_in_transit'] as Map<String, dynamic>),
      stringToDateTime(json['easypost_estimated_delivery_date'] as String?),
      stringToDateTime(json['planned_ship_date'] as String?),
    );

Map<String, dynamic> _$TimeInTransitDetailsToJson(
        TimeInTransitDetails instance) =>
    <String, dynamic>{
      'days_in_transit': instance.daysInTransit?.toJson(),
      'easypost_estimated_delivery_date':
          dateTimeToStringYYYYMMDD(instance.estimatedDeliveryDate),
      'planned_ship_date': dateTimeToStringYYYYMMDD(instance.plannedShipDate),
    };

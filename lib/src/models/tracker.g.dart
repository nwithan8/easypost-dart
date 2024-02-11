// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracker _$TrackerFromJson(Map<String, dynamic> json) => Tracker(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['carrier'] as String?,
      json['carrier_detail'] == null
          ? null
          : CarrierDetail.fromJson(
              json['carrier_detail'] as Map<String, dynamic>),
      json['est_delivery_date'] == null
          ? null
          : DateTime.parse(json['est_delivery_date'] as String),
      json['public_url'] as String?,
      json['shipment_id'] as String?,
      json['signed_by'] as String?,
      json['status'] as String?,
      json['tracking_code'] as String?,
      (json['tracking_details'] as List<dynamic>?)
          ?.map((e) => TrackingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['tracking_updated_at'] == null
          ? null
          : DateTime.parse(json['tracking_updated_at'] as String),
      (json['weight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TrackerToJson(Tracker instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'carrier': instance.carrier,
      'carrier_detail': instance.carrierDetail?.toJson(),
      'est_delivery_date': instance.estDeliveryDate?.toIso8601String(),
      'public_url': instance.publicUrl,
      'shipment_id': instance.shipmentId,
      'signed_by': instance.signedBy,
      'status': instance.status,
      'tracking_code': instance.trackingCode,
      'tracking_details':
          instance.trackingDetails?.map((e) => e.toJson()).toList(),
      'tracking_updated_at': instance.trackingUpdatedAt?.toIso8601String(),
      'weight': instance.weight,
    };

TrackerCollection _$TrackerCollectionFromJson(Map<String, dynamic> json) =>
    TrackerCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['trackers'] as List<dynamic>?)
          ?.map((e) => Tracker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackerCollectionToJson(TrackerCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'trackers': instance.trackers?.map((e) => e.toJson()).toList(),
    };

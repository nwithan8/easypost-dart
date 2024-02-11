// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Batch _$BatchFromJson(Map<String, dynamic> json) => Batch(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['error'] as String?,
      json['label_url'] as String?,
      json['message'] as String?,
      json['num_shipments'] as int?,
      json['reference'] as String?,
      json['scan_form'] == null
          ? null
          : ScanForm.fromJson(json['scan_form'] as Map<String, dynamic>),
      (json['shipments'] as List<dynamic>?)
          ?.map((e) => BatchShipment.fromJson(e as Map<String, dynamic>))
          .toList(),
      BatchState.fromString(json['state'] as String?),
      (json['status'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
    );

Map<String, dynamic> _$BatchToJson(Batch instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'error': instance.error,
      'label_url': instance.labelUrl,
      'message': instance.message,
      'num_shipments': instance.numShipments,
      'reference': instance.reference,
      'scan_form': instance.scanForm?.toJson(),
      'shipments': instance.shipments?.map((e) => e.toJson()).toList(),
      'state': BatchState.asString(instance.state),
      'status': instance.status,
    };

BatchCollection _$BatchCollectionFromJson(Map<String, dynamic> json) =>
    BatchCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['batches'] as List<dynamic>?)
          ?.map((e) => Batch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchCollectionToJson(BatchCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'batches': instance.batches?.map((e) => e.toJson()).toList(),
    };

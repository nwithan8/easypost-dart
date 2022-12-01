import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/carrier_detail.dart';
import 'package:easypost/src/models/tracking_detail.dart';
import 'package:easypost/src/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracker.g.dart';

@JsonSerializable(explicitToJson: true)
class Tracker extends Model {
  @JsonKey(name: 'carrier')
  final String? carrier;

  @JsonKey(name: 'carrier_detail')
  final CarrierDetail? carrierDetail;

  @JsonKey(name: 'est_delivery_date')
  final DateTime? estDeliveryDate;

  @JsonKey(name: 'public_url')
  final String? publicUrl;

  @JsonKey(name: 'shipment_id')
  final String? shipmentId;

  @JsonKey(name: 'signed_by')
  final String? signedBy;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  @JsonKey(name: 'tracking_details')
  final List<TrackingDetail>? trackingDetails;

  @JsonKey(name: 'tracking_updated_at')
  final DateTime? trackingUpdatedAt;

  @JsonKey(name: 'weight')
  final double? weight;

  Tracker(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.carrier,
    this.carrierDetail,
    this.estDeliveryDate,
    this.publicUrl,
    this.shipmentId,
    this.signedBy,
    this.status,
    this.trackingCode,
    this.trackingDetails,
    this.trackingUpdatedAt,
    this.weight,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Tracker.fromJson(Map<String, dynamic> input) =>
      _$TrackerFromJson(input);

  Map<String, dynamic> toJson() => _$TrackerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TrackerCollection extends Collection {
  @JsonKey(name: 'trackers')
  final List<Tracker>? trackers;

  TrackerCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.trackers)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory TrackerCollection.fromJson(Map<String, dynamic> input) =>
      _$TrackerCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$TrackerCollectionToJson(this);
}

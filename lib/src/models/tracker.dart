import 'package:easypost/src/api/parameters/v2/trackers/list_trackers.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/carrier_detail.dart';
import 'package:easypost/src/models/tracking_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tracker.g.dart';

@JsonSerializable(explicitToJson: true)
class Tracker extends ReadOnlyModelWithId {
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

  @override
  Map<String, dynamic> toJson() => _$TrackerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TrackerCollection extends PaginatedCollection<Tracker, ListTrackers> {
  @JsonKey(name: 'trackers')
  final List<Tracker>? trackers;

  TrackerCollection(objectType, mode, hasMore, this.trackers)
      : super(objectType, mode, hasMore);

  factory TrackerCollection.fromJson(Map<String, dynamic> input) =>
      _$TrackerCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$TrackerCollectionToJson(this);

  @override
  ListTrackers buildGetNextPageParameters(List<Tracker>? currentPageItems,
      {int? pageSize}) {
    ListTrackers parameters = filters ?? ListTrackers();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

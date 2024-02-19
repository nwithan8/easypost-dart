import 'package:easypost/src/api/parameters/v2/batches/list_batches.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/enums/batch_state.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/batch_shipment.dart';
import 'package:easypost/src/models/scan_form.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch.g.dart';

@JsonSerializable(explicitToJson: true)
class Batch extends ReadOnlyModelWithId {
  @JsonKey(name: 'error')
  final String? error;

  @JsonKey(name: 'label_url')
  final String? labelUrl;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'num_shipments')
  final int? numShipments;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'scan_form')
  final ScanForm? scanForm;

  @JsonKey(name: 'shipments')
  final List<BatchShipment>? shipments;

  @JsonKey(
      name: 'state',
      fromJson: BatchState.fromString,
      toJson: BatchState.asString)
  final BatchState? state;

  @JsonKey(name: 'status')
  final Map<String, int>? status;

  Batch(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      this.error,
      this.labelUrl,
      this.message,
      this.numShipments,
      this.reference,
      this.scanForm,
      this.shipments,
      this.state,
      this.status)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory Batch.fromJson(Map<String, dynamic> input) => _$BatchFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$BatchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BatchCollection extends PaginatedCollection<Batch, ListBatches> {
  @JsonKey(name: 'batches')
  final List<Batch>? batches;

  BatchCollection(objectType, mode, hasMore, this.batches)
      : super(objectType, mode, hasMore);

  factory BatchCollection.fromJson(Map<String, dynamic> input) =>
      _$BatchCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$BatchCollectionToJson(this);

  @override
  ListBatches buildGetNextPageParameters(List<Batch>? currentPageItems,
      {int? pageSize}) {
    ListBatches parameters = filters ?? ListBatches();

    // Batches get returned in reverse order from everything else (oldest first instead of newest first), so this needs to be "after_id" instead of "before_id"
    parameters.afterId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

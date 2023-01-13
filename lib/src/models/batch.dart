import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/batch_shipment.dart';
import 'package:easypost/src/models/scan_form.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'batch.g.dart';

@JsonSerializable(explicitToJson: true)
class Batch extends Model {
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

  @JsonKey(name: 'state')
  final String? state;

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

  Map<String, dynamic> toJson() => _$BatchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BatchCollection extends Collection {
  @JsonKey(name: 'batches')
  final List<Batch>? batches;

  BatchCollection(id, createdAt, updatedAt, objectType, mode, hasMore, this.batches)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory BatchCollection.fromJson(Map<String, dynamic> input) =>
      _$BatchCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$BatchCollectionToJson(this);
}

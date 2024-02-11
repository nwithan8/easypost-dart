import 'package:easypost/src/api/parameters/v2/scan_forms/list_scan_forms.dart';
import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'scan_form.g.dart';

@JsonSerializable(explicitToJson: true)
class ScanForm extends ModelWithId {
  @JsonKey(name: 'address')
  final Address? address;

  @JsonKey(name: 'batch_id')
  final String? batchId;

  @JsonKey(name: 'form_file_type')
  final String? formFileType;

  @JsonKey(name: 'form_url')
  final String? formUrl;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tracking_codes')
  final List<String>? trackingCodes;

  ScanForm(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.address,
    this.batchId,
    this.formFileType,
    this.formUrl,
    this.message,
    this.status,
    this.trackingCodes,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory ScanForm.fromJson(Map<String, dynamic> input) =>
      _$ScanFormFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ScanFormToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ScanFormCollection extends PaginatedCollection<ScanForm, ListScanForms> {
  @JsonKey(name: 'scan_forms')
  final List<ScanForm>? scanForms;

  ScanFormCollection(
      objectType, mode, hasMore, this.scanForms)
      : super(objectType, mode, hasMore);

  factory ScanFormCollection.fromJson(Map<String, dynamic> input) =>
      _$ScanFormCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ScanFormCollectionToJson(this);

  @override
  ListScanForms buildGetNextPageParameters(List<ScanForm>? currentPageItems, {int? pageSize}) {
    ListScanForms parameters = filters ?? ListScanForms();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

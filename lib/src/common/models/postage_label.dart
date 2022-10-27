import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postage_label.g.dart';

@JsonSerializable(explicitToJson: true)
class PostageLabel extends Model {
  @JsonKey(name: 'date_advance')
  final int? dateAdvance;

  @JsonKey(name: 'integrated_form')
  final String? integratedForm;

  @JsonKey(name: 'label_date')
  final DateTime? labelDate;

  @JsonKey(name: 'label_epl2_url')
  final String? labelEpl2Url;

  @JsonKey(name: 'label_file')
  final String? labelFile;

  @JsonKey(name: 'label_file_type')
  final String? labelFileType;

  @JsonKey(name: 'label_pdf_url')
  final String? labelPdfUrl;

  @JsonKey(name: 'label_resolution')
  final int? labelResolution;

  @JsonKey(name: 'label_size')
  final String? labelSize;

  @JsonKey(name: 'label_type')
  final String? labelType;

  @JsonKey(name: 'label_url')
  final String? labelUrl;

  @JsonKey(name: 'label_zpl_url')
  final String? labelZplUrl;

  PostageLabel(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.dateAdvance,
    this.integratedForm,
    this.labelDate,
    this.labelEpl2Url,
    this.labelFile,
    this.labelFileType,
    this.labelPdfUrl,
    this.labelResolution,
    this.labelSize,
    this.labelType,
    this.labelUrl,
    this.labelZplUrl,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory PostageLabel.fromJson(Map<String, dynamic> input) =>
      _$PostageLabelFromJson(input);

  Map<String, dynamic> toJson() => _$PostageLabelToJson(this);
}

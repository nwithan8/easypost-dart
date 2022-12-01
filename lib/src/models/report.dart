import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(explicitToJson: true)
class Report extends Model {
  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  @JsonKey(name: 'include_children')
  final bool? includeChildren;

  @JsonKey(name: 'start_date')
  final DateTime? startDate;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'url')
  final String? url;

  @JsonKey(name: 'url_expires_at')
  final DateTime? urlExpiresAt;

  Report(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.endDate,
    this.includeChildren,
    this.startDate,
    this.status,
    this.url,
    this.urlExpiresAt,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Report.fromJson(Map<String, dynamic> input) =>
      _$ReportFromJson(input);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportCollection extends Collection {
  @JsonKey(name: 'reports')
  final List<Report>? reports;

  @JsonKey(name: 'type')
  final String? type;

  ReportCollection(id, createdAt, updatedAt, objectType, mode, hasMore,
      this.reports, this.type)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory ReportCollection.fromJson(Map<String, dynamic> input) =>
      _$ReportCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$ReportCollectionToJson(this);
}

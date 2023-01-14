import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payload.g.dart';

@JsonSerializable(explicitToJson: true)
class Payload extends Model {
  @JsonKey(name: 'request_url')
  final String? requestUrl;

  @JsonKey(name: 'request_headers')
  final Map<String, String>? requestHeaders;

  @JsonKey(name: 'request_body')
  final Map<String, dynamic>? requestBody;

  @JsonKey(name: 'response_headers')
  final Map<String, String>? responseHeaders;

  @JsonKey(name: 'response_body')
  final String? responseBody;

  @JsonKey(name: 'response_code')
  final int? responseCode;

  @JsonKey(name: 'total_time')
  final int? totalTime;

  Payload(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.requestUrl,
    this.requestHeaders,
    this.requestBody,
    this.responseHeaders,
    this.responseBody,
    this.responseCode,
    this.totalTime,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Payload.fromJson(Map<String, dynamic> input) =>
      _$PayloadFromJson(input);

  Map<String, dynamic> toJson() => _$PayloadToJson(this);
}

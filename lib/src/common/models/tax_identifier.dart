import 'package:easypost/src/common/base/model.dart';
import 'package:easypost/src/common/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax_identifier.g.dart';

@JsonSerializable(explicitToJson: true)
class TaxIdentifier extends Model {
  @JsonKey(name: 'entity')
  final String? entity;

  @JsonKey(name: 'issuing_country')
  final String? issuingCountry;

  @JsonKey(name: 'tax_id')
  final String? taxId;

  @JsonKey(name: 'tax_id_type')
  final String? taxIdType;

  TaxIdentifier(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.entity,
    this.issuingCountry,
    this.taxId,
    this.taxIdType,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory TaxIdentifier.fromJson(Map<String, dynamic> input) =>
      _$TaxIdentifierFromJson(input);

  Map<String, dynamic> toJson() => _$TaxIdentifierToJson(this);
}

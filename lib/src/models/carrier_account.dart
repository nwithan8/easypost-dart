import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/utilities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_account.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierAccount extends Model {
  @JsonKey(name: 'billable_type')
  final String? billableType;

  @JsonKey(name: 'credentials')
  final Map<String, dynamic>? credentials;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'readable')
  final String? readable;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'test_credentials')
  final Map<String, dynamic>? testCredentials;

  @JsonKey(name: 'type')
  final String? type;

  CarrierAccount(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.billableType,
    this.credentials,
    this.description,
    this.readable,
    this.reference,
    this.testCredentials,
    this.type
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory CarrierAccount.fromJson(Map<String, dynamic> input) =>
      _$CarrierAccountFromJson(input);

  Map<String, dynamic> toJson() => _$CarrierAccountToJson(this);
}

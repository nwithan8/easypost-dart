import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easypost/src/api/parameters/iparameters.dart';

part 'carrier_account.g.dart';

@JsonSerializable(explicitToJson: true)
class CarrierAccount extends ReadOnlyModelWithId
    implements ICarrierAccountParameter {
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

  CarrierAccount(id, createdAt, updatedAt, objectType, mode,
      [this.billableType,
      this.credentials,
      this.description,
      this.readable,
      this.reference,
      this.testCredentials,
      this.type])
      : super(id, createdAt, updatedAt, objectType, mode);

  factory CarrierAccount.fromJson(Map<String, dynamic> input) =>
      _$CarrierAccountFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$CarrierAccountToJson(this);

  static CarrierAccount fromId(String carrierAccountId) =>
      CarrierAccount(carrierAccountId, null, null, null, null);
}

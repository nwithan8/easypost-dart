import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/verifications.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable(explicitToJson: true)
class Address extends Model {
  @JsonKey(name: 'carrier_facility')
  final String? carrierFacility;
  @JsonKey(name: 'city')
  final String? city;
  @JsonKey(name: 'company')
  final String? company;
  @JsonKey(name: 'country')
  final String? country;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'error')
  final String? error;
  @JsonKey(name: 'federal_tax_id')
  final String? federalTaxId;
  @JsonKey(name: 'message')
  final String? message;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'phone')
  final String? phone;
  @JsonKey(name: 'residential')
  final bool? residential;
  @JsonKey(name: 'state')
  final String? state;
  @JsonKey(name: 'state_tax_id')
  final String? stateTaxId;
  @JsonKey(name: 'street1')
  final String? street1;
  @JsonKey(name: 'street2')
  final String? street2;
  @JsonKey(name: 'verifications')
  final Verifications? verifications;
  @JsonKey(name: 'zip')
  final String? zip;

  Address(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      this.carrierFacility,
      this.city,
      this.company,
      this.country,
      this.email,
      this.federalTaxId,
      this.message,
      this.name,
      this.phone,
      this.residential,
      this.state,
      this.stateTaxId,
      this.street1,
      this.street2,
      this.verifications,
      this.zip,
      this.error)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory Address.fromJson(Map<String, dynamic> input) =>
      _$AddressFromJson(input);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddressCollection extends Collection {
  @JsonKey(name: 'addresses')
  final List<Address> addresses;

  AddressCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.addresses)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory AddressCollection.fromJson(Map<String, dynamic> input) =>
      _$AddressCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$AddressCollectionToJson(this);
}

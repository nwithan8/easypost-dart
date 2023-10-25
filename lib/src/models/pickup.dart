import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/message.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pickup.g.dart';

@JsonSerializable(explicitToJson: true)
class Pickup extends ModelWithId {
  @JsonKey(name: 'address')
  final Address? address;

  @JsonKey(name: 'carrier_accounts')
  final List<CarrierAccount>? carrierAccounts;

  @JsonKey(name: 'confirmation')
  final String? confirmation;

  @JsonKey(name: 'instructions')
  final String? instructions;

  @JsonKey(name: 'is_account_address')
  final bool? isAccountAddress;

  @JsonKey(name: 'max_datetime')
  final DateTime? maxDatetime;

  @JsonKey(name: 'messages')
  final List<Message>? messages;

  @JsonKey(name: 'min_datetime')
  final DateTime? minDatetime;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'pickup_rates')
  final List<PickupRate>? pickupRates;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'status')
  final String? status;

  Pickup(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.address,
    this.carrierAccounts,
    this.confirmation,
    this.instructions,
    this.isAccountAddress,
    this.maxDatetime,
    this.messages,
    this.minDatetime,
    this.name,
    this.pickupRates,
    this.reference,
    this.status,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Pickup.fromJson(Map<String, dynamic> input) =>
      _$PickupFromJson(input);

  Map<String, dynamic> toJson() => _$PickupToJson(this);

  PickupRate associatedPickupRate(Rate rate) {
    return pickupRates!.firstWhere((pickupRate) =>
        pickupRate.carrier != null &&
        pickupRate.carrier == rate.carrier &&
        pickupRate.service != null &&
        pickupRate.service == rate.service &&
        pickupRate.price == rate.price);
  }
}

@JsonSerializable(explicitToJson: true)
class PickupCollection extends Collection {
  @JsonKey(name: 'pickups')
  final List<Pickup>? pickups;

  PickupCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.pickups)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory PickupCollection.fromJson(Map<String, dynamic> input) =>
      _$PickupCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$PickupCollectionToJson(this);
}

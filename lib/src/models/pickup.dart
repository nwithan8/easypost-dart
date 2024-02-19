import 'package:easypost/src/api/parameters/v2/pickups/list_pickups.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/message.dart';
import 'package:easypost/src/models/pickup_rate.dart';
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pickup.g.dart';

@JsonSerializable(explicitToJson: true)
class Pickup extends ReadOnlyModelWithId {
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
  final List<PickupRate>? rates;

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
    this.rates,
    this.reference,
    this.status,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Pickup.fromJson(Map<String, dynamic> input) =>
      _$PickupFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PickupToJson(this);

  PickupRate? associatedPickupRate(QuotedRate rate, {bool lockPrice = false}) {
    if (rates == null) {
      throw MissingPropertyException.generate(toString(), 'rates');
    }

    filterFunction(PickupRate pickupRate) {
      if (pickupRate.price == null) {
        return false;
      }

      if (lockPrice) {
        if (pickupRate.price != rate.price) {
          return false;
        }
      }

      if (pickupRate.carrier != null) {
        if (rate.carrier != null) {
          if (pickupRate.carrier != rate.carrier) {
            return false;
          }
        }
      }

      if (pickupRate.service != null) {
        if (rate.service != null) {
          if (pickupRate.service != rate.service) {
            return false;
          }
        }
      }

      return true;
    }

    try {
      return rates!.firstWhere(filterFunction);
    } on StateError {
      return null;
    }
  }
}

@JsonSerializable(explicitToJson: true)
class PickupCollection extends PaginatedCollection<Pickup, ListPickups> {
  @JsonKey(name: 'pickups')
  final List<Pickup>? pickups;

  PickupCollection(
      objectType, mode, hasMore, this.pickups)
      : super(objectType, mode, hasMore);

  factory PickupCollection.fromJson(Map<String, dynamic> input) =>
      _$PickupCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PickupCollectionToJson(this);

  @override
  ListPickups buildGetNextPageParameters(List<Pickup>? currentPageItems,
      {int? pageSize}) {
    ListPickups parameters = filters ?? ListPickups();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

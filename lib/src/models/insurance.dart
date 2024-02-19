import 'package:easypost/src/api/parameters/v2/insurance/list_insurance.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/enums/insurance_provider.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insurance.g.dart';

@JsonSerializable(explicitToJson: true)
class Insurance extends ReadOnlyModelWithId {
  @JsonKey(name: 'amount', fromJson: stringToMoney, toJson: moneyToString)
  final double? amount;

  @JsonKey(name: 'from_address')
  final Address? fromAddress;

  @JsonKey(name: 'messages')
  final List<String>? messages;

  @JsonKey(
      name: 'provider',
      fromJson: InsuranceProvider.fromString,
      toJson: InsuranceProvider.asString)
  final InsuranceProvider? provider;

  @JsonKey(name: 'provider_id')
  final String? providerId;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'shipment_id')
  final String? shipmentId;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'to_address')
  final Address? toAddress;

  @JsonKey(name: 'tracker')
  final Tracker? tracker;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  Insurance(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.status,
    this.amount,
    this.fromAddress,
    this.messages,
    this.provider,
    this.providerId,
    this.reference,
    this.shipmentId,
    this.toAddress,
    this.tracker,
    this.trackingCode,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Insurance.fromJson(Map<String, dynamic> input) =>
      _$InsuranceFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$InsuranceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InsuranceCollection
    extends PaginatedCollection<Insurance, ListInsurance> {
  @JsonKey(name: 'insurances')
  final List<Insurance>? insurances;

  InsuranceCollection(objectType, mode, hasMore, this.insurances)
      : super(objectType, mode, hasMore);

  factory InsuranceCollection.fromJson(Map<String, dynamic> input) =>
      _$InsuranceCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$InsuranceCollectionToJson(this);

  @override
  ListInsurance buildGetNextPageParameters(List<Insurance>? currentPageItems,
      {int? pageSize}) {
    ListInsurance parameters = filters ?? ListInsurance();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

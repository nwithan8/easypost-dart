import 'package:easypost/src/api/parameters/v2/users/list_child_users.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/api_key.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends ReadOnlyModelWithId {
  @JsonKey(name: 'api_keys')
  final List<ApiKey>? apiKeys;

  @JsonKey(name: 'balance', fromJson: stringToMoney, toJson: moneyToString)
  final double? balance;

  @JsonKey(name: 'children')
  final List<User>? children;

  @JsonKey(
      name: 'cc_fee_rate', fromJson: stringToDouble, toJson: doubleToString)
  final double? convenienceFeeRate;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(
      name: 'insurance_fee_rate',
      fromJson: stringToDouble,
      toJson: doubleToString)
  final double? insuranceFeeRate;

  @JsonKey(
      name: 'insurance_fee_minimum',
      fromJson: stringToMoney,
      toJson: moneyToString)
  final double? insuranceFeeMinimum;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'parent_id')
  final String? parentId;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(
      name: 'price_per_shipment',
      fromJson: stringToMoney,
      toJson: moneyToString)
  final double? pricePerShipment;

  @JsonKey(
      name: 'recharge_amount', fromJson: stringToMoney, toJson: moneyToString)
  final double? rechargeAmount;

  @JsonKey(name: 'recharge_threshold')
  final String? rechargeThreshold;

  @JsonKey(
      name: 'secondary_recharge_amount',
      fromJson: stringToMoney,
      toJson: moneyToString)
  final double? secondaryRechargeAmount;

  User(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.apiKeys,
    this.balance,
    this.children,
    this.convenienceFeeRate,
    this.email,
    this.insuranceFeeRate,
    this.insuranceFeeMinimum,
    this.name,
    this.parentId,
    this.password,
    this.passwordConfirmation,
    this.phoneNumber,
    this.pricePerShipment,
    this.rechargeAmount,
    this.rechargeThreshold,
    this.secondaryRechargeAmount,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory User.fromJson(Map<String, dynamic> input) => _$UserFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ChildUserCollection extends PaginatedCollection<User, ListChildUsers> {
  @JsonKey(name: 'children')
  final List<User>? children;

  ChildUserCollection(objectType, mode, hasMore, this.children)
      : super(objectType, mode, hasMore);

  factory ChildUserCollection.fromJson(Map<String, dynamic> input) =>
      _$ChildUserCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ChildUserCollectionToJson(this);

  @override
  ListChildUsers buildGetNextPageParameters(List<User>? currentPageItems,
      {int? pageSize}) {
    ListChildUsers parameters = filters ?? ListChildUsers();

    // Child users go oldest to newest, so only can use afterId
    parameters.afterId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

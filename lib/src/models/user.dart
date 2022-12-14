import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/api_key.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Model {
  @JsonKey(name: 'api_keys')
  final List<ApiKey>? apiKeys;

  @JsonKey(name: 'balance', fromJson: stringToMoney, toJson: moneyToString)
  final double? balance;

  @JsonKey(name: 'children')
  final List<User>? children;

  @JsonKey(name: 'email')
  final String? email;

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
    this.email,
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

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

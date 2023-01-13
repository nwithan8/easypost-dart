import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/models/payment_method_type.dart';
import 'package:easypost/src/utilities/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentMethod extends Model {
  @JsonKey(name: 'bank_name')
  final String? bankName;

  @JsonKey(name: 'brand')
  final String? brand;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(
      name: 'disabled_at', fromJson: stringToDateTime, toJson: dateTimeToString)
  final DateTime? disabledAt;

  @JsonKey(name: 'exp_month')
  final int? expMonth;

  @JsonKey(name: 'exp_year')
  final int? expYear;

  @JsonKey(name: 'last4')
  final String? last4;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'verified')
  final bool? verified;

  PaymentMethodType? get type {
    if (id == null) {
      return null;
    }

    if (id!.startsWith('card_')) {
      return PaymentMethodType.card;
    } else if (id!.startsWith('bank_')) {
      return PaymentMethodType.bank;
    } else {
      return null;
    }
  }

  PaymentMethod(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.bankName,
    this.brand,
    this.country,
    this.disabledAt,
    this.expMonth,
    this.expYear,
    this.last4,
    this.name,
    this.verified,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory PaymentMethod.fromJson(Map<String, dynamic> input) =>
      _$PaymentMethodFromJson(input);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}

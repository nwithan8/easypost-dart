import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/enums/payment_method_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

@JsonSerializable(explicitToJson: true)
class PaymentMethod extends ModelWithId {
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
  final bool? isVerified;

  PaymentMethodType? get type {
    if (id == null) {
      return null;
    }

    return PaymentMethodType.fromPrefix(id!);
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
    this.isVerified,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory PaymentMethod.fromJson(Map<String, dynamic> input) =>
      _$PaymentMethodFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}

import 'package:easypost/src/base/readonly_model.dart';
import 'package:easypost/src/enums/payment_option_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_options.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PaymentOptions extends ReadOnlyModel {
  @JsonKey(name: 'type', toJson: paymentOptionTypeToJson, fromJson: paymentOptionTypeFromJson, disallowNullValue: true)
  late PaymentOptionType? type;

  @JsonKey(name: 'account')
  late String? accountNumber;

  @JsonKey(name: 'country')
  late String? countryCode;

  @JsonKey(name: 'postage_code')
  late String? postalCode;

  PaymentOptions({
    objectType,
    mode,
    this.type,
    this.accountNumber,
    this.countryCode,
    this.postalCode,
  }) : super(objectType, mode);

  factory PaymentOptions.fromJson(Map<String, dynamic> input) =>
      _$PaymentOptionsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$PaymentOptionsToJson(this);
}

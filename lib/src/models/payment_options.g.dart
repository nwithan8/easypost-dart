// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptions _$PaymentOptionsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['type'],
  );
  return PaymentOptions(
    objectType: json['object'],
    mode: json['mode'],
    type: paymentOptionTypeFromJson(json['type'] as String?),
    accountNumber: json['account'] as String?,
    countryCode: json['country'] as String?,
    postalCode: json['postage_code'] as String?,
  );
}

Map<String, dynamic> _$PaymentOptionsToJson(PaymentOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.objectType);
  writeNotNull('mode', instance.mode);
  writeNotNull('type', paymentOptionTypeToJson(instance.type));
  writeNotNull('account', instance.accountNumber);
  writeNotNull('country', instance.countryCode);
  writeNotNull('postage_code', instance.postalCode);
  return val;
}

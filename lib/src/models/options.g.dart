// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      json['object'],
      json['mode'],
      json['additional_handling'] as bool?,
      json['address_validation_level'] as String?,
      json['alcohol'] as bool?,
      json['billing_ref'] as String?,
      json['by_drone'] as bool?,
      json['carrier_insurance_amount'] as String?,
      json['carrier_notification_email'] as String?,
      json['carrier_notification_sms'] as String?,
      json['certified_mail'] as bool?,
      json['cod_address_id'] as String?,
      json['cod_amount'] as String?,
      codMethodFromJson(json['cod_method'] as String?),
      json['commercial_invoice_format'] as String?,
      json['commercial_invoice_letterhead'] as String?,
      json['commercial_invoice_signature'] as String?,
      json['commercial_invoice_size'] as String?,
      json['cost_center'] as String?,
      json['currency'] as String?,
      json['customs_broker_address_id'] as String?,
      json['customs_include_shipping'] as bool?,
      json['declared_value'] as String?,
      json['delivered_duty_paid'] as bool?,
      deliveryConfirmationFromJson(json['delivery_confirmation'] as String?),
      json['delivery_time_preference'] as String?,
      stringToDateTime(json['dropoff_max_datetime'] as String?),
      dropOffTypeFromJson(json['dropoff_type'] as String?),
      json['dry_ice'] as bool?,
      json['dry_ice_medical'] as bool?,
      json['dry_ice_weight'] as String?,
      json['duty_payment'] == null
          ? null
          : PaymentOptions.fromJson(
              json['duty_payment'] as Map<String, dynamic>),
      json['duty_payment_account'] as String?,
      endorsementFromJson(json['endorsement'] as String?),
      json['end_shipper_id'] as String?,
      json['freight_charge'] as String?,
      json['group'] as String?,
      json['handling_instructions'] as String?,
      hazmatTypeFromJson(json['hazmat'] as String?),
      json['hold_for_pickup'] as bool?,
      json['image_format'] as String?,
      json['importer_address_id'] as String?,
      json['import_federal_tax_id'] as String?,
      json['import_state_tax_id'] as String?,
      incotermTypeFromJson(json['incoterm'] as String?),
      json['invoice_number'] as String?,
      stringToDateTime(json['label_date'] as String?),
      labelFormatFromJson(json['label_format'] as String?),
      json['label_size'] as String?,
      json['license_number'] as String?,
      json['machinable'] as String?,
      json['neutral_delivery'] as bool?,
      json['non_contact'] as bool?,
      json['overlabel_construct_code'] as String?,
      json['overlabel_construct_tracking_number'] as String?,
      json['parties_to_transaction_are_related'] as String?,
      json['payment'] == null
          ? null
          : PaymentOptions.fromJson(json['payment'] as Map<String, dynamic>),
      json['peel_and_return'] as bool?,
      stringToDateTime(json['pickup_max_datetime'] as String?),
      stringToDateTime(json['pickup_min_datetime'] as String?),
      json['po_sort'] as String?,
      json['postage_label_inline'] as bool?,
      (json['print_custom'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      json['print_custom_1'] as String?,
      json['print_custom_1_barcode'] as bool?,
      printCustomCodeFromJson(json['print_custom_1_code'] as String?),
      json['print_custom_2'] as String?,
      json['print_custom_2_barcode'] as bool?,
      printCustomCodeFromJson(json['print_custom_2_code'] as String?),
      json['print_custom_3'] as String?,
      json['print_custom_3_barcode'] as bool?,
      printCustomCodeFromJson(json['print_custom_3_code'] as String?),
      json['print_rate'] as bool?,
      json['receiver_liquor_license'] as String?,
      json['registered_mail'] as bool?,
      (json['registered_mail_amount'] as num?)?.toDouble(),
      json['return_receipt'] as bool?,
      json['return_service'] as String?,
      json['saturday_delivery'] as bool?,
      json['settlement_method'] as String?,
      json['smartpost_hub'] as String?,
      json['smartpost_manifest'] as String?,
      json['special_rates_eligibility'] as String?,
      json['suppress_etd'] as bool?,
      stringToDateTime(json['tax_id_expiration_date'] as String?),
    )
      ..contentDescription = json['content_description'] as String?
      ..deliveryMinDatetime =
          stringToDateTime(json['delivery_min_datetime'] as String?)
      ..deliveryMaxDatetime =
          stringToDateTime(json['delivery_max_datetime'] as String?);

Map<String, dynamic> _$OptionsToJson(Options instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('object', instance.objectType);
  writeNotNull('mode', instance.mode);
  writeNotNull('additional_handling', instance.additionalHandling);
  writeNotNull('address_validation_level', instance.addressValidationLevel);
  writeNotNull('alcohol', instance.isAlcohol);
  writeNotNull('billing_ref', instance.billingRef);
  writeNotNull('by_drone', instance.deliverByDrone);
  writeNotNull('carrier_insurance_amount', instance.carrierInsuranceAmount);
  writeNotNull('carrier_notification_email', instance.carrierNotificationEmail);
  writeNotNull('carrier_notification_sms', instance.carrierNotificationSms);
  writeNotNull('certified_mail', instance.useCertifiedMail);
  writeNotNull('cod_address_id', instance.codAddressId);
  writeNotNull('cod_amount', instance.codAmount);
  writeNotNull('cod_method', codMethodToJson(instance.codMethod));
  writeNotNull('commercial_invoice_format', instance.commercialInvoiceFormat);
  writeNotNull(
      'commercial_invoice_letterhead', instance.commercialInvoiceLetterhead);
  writeNotNull(
      'commercial_invoice_signature', instance.commercialInvoiceSignature);
  writeNotNull('commercial_invoice_size', instance.commercialInvoiceSize);
  writeNotNull('content_description', instance.contentDescription);
  writeNotNull('cost_center', instance.costCenter);
  writeNotNull('currency', instance.currency);
  writeNotNull('customs_broker_address_id', instance.customsBrokerAddressId);
  writeNotNull('customs_include_shipping', instance.customsIncludeShipping);
  writeNotNull('declared_value', instance.declaredValue);
  writeNotNull('delivered_duty_paid', instance.deliveredDutyPaid);
  writeNotNull('delivery_confirmation',
      deliveryConfirmationToJson(instance.deliveryConfirmation));
  writeNotNull('delivery_time_preference', instance.deliveryTimePreference);
  writeNotNull(
      'delivery_min_datetime', dateTimeToString(instance.deliveryMinDatetime));
  writeNotNull(
      'delivery_max_datetime', dateTimeToString(instance.deliveryMaxDatetime));
  writeNotNull(
      'dropoff_max_datetime', dateTimeToString(instance.dropoffMaxDatetime));
  writeNotNull('dropoff_type', dropOffTypeToJson(instance.dropoffType));
  writeNotNull('dry_ice', instance.isDryIce);
  writeNotNull('dry_ice_medical', instance.isDryIceMedical);
  writeNotNull('dry_ice_weight', instance.dryIceWeight);
  writeNotNull('duty_payment', instance.dutyPayment?.toJson());
  writeNotNull('duty_payment_account', instance.dutyPaymentAccount);
  writeNotNull('endorsement', endorsementToJson(instance.endorsement));
  writeNotNull('end_shipper_id', instance.endShipperId);
  writeNotNull('freight_charge', instance.freightCharge);
  writeNotNull('group', instance.group);
  writeNotNull('handling_instructions', instance.handlingInstructions);
  writeNotNull('hazmat', hazmatTypeToJson(instance.hazmat));
  writeNotNull('hold_for_pickup', instance.holdForPickup);
  writeNotNull('image_format', instance.imageFormat);
  writeNotNull('importer_address_id', instance.importerAddressId);
  writeNotNull('import_federal_tax_id', instance.importFederalTaxId);
  writeNotNull('import_state_tax_id', instance.importStateTaxId);
  writeNotNull('incoterm', incotermTypeToJson(instance.incoterm));
  writeNotNull('invoice_number', instance.invoiceNumber);
  writeNotNull('label_date', dateTimeToString(instance.labelDate));
  writeNotNull('label_format', labelFormatToJson(instance.labelFormat));
  writeNotNull('label_size', instance.labelSize);
  writeNotNull('license_number', instance.licenseNumber);
  writeNotNull('machinable', instance.machinable);
  writeNotNull('neutral_delivery', instance.enableNeutralDelivery);
  writeNotNull('non_contact', instance.enableNonContact);
  writeNotNull('overlabel_construct_code', instance.overlabelConstructCode);
  writeNotNull('overlabel_construct_tracking_number',
      instance.overlabelConstructTrackingNumber);
  writeNotNull('parties_to_transaction_are_related',
      instance.partiesToTransactionAreRelated);
  writeNotNull('payment', instance.payment?.toJson());
  writeNotNull('peel_and_return', instance.enablePeelAndReturn);
  writeNotNull(
      'pickup_max_datetime', dateTimeToString(instance.pickupMaxDatetime));
  writeNotNull(
      'pickup_min_datetime', dateTimeToString(instance.pickupMinDatetime));
  writeNotNull('po_sort', instance.poSort);
  writeNotNull('postage_label_inline', instance.postageLabelInline);
  writeNotNull('print_custom', instance.printCustom);
  writeNotNull('print_custom_1', instance.printCustomMessage1);
  writeNotNull('print_custom_1_barcode', instance.includePrintCustomBarcode1);
  writeNotNull(
      'print_custom_1_code', printCustomCodeToJson(instance.printCustomCode1));
  writeNotNull('print_custom_2', instance.printCustomMessage2);
  writeNotNull('print_custom_2_barcode', instance.includePrintCustomBarcode2);
  writeNotNull(
      'print_custom_2_code', printCustomCodeToJson(instance.printCustomCode2));
  writeNotNull('print_custom_3', instance.printCustomMessage3);
  writeNotNull('print_custom_3_barcode', instance.includePrintCustomBarcode3);
  writeNotNull(
      'print_custom_3_code', printCustomCodeToJson(instance.printCustomCode3));
  writeNotNull('print_rate', instance.includePrintRate);
  writeNotNull('receiver_liquor_license', instance.receiverLiquorLicense);
  writeNotNull('registered_mail', instance.useRegisteredMail);
  writeNotNull('registered_mail_amount', instance.registeredMailAmount);
  writeNotNull('return_receipt', instance.includeReturnReceipt);
  writeNotNull('return_service', instance.returnService);
  writeNotNull('saturday_delivery', instance.enableSaturdayDelivery);
  writeNotNull('settlement_method', instance.settlementMethod);
  writeNotNull('smartpost_hub', instance.smartpostHub);
  writeNotNull('smartpost_manifest', instance.smartpostManifest);
  writeNotNull('special_rates_eligibility', instance.specialRatesEligibility);
  writeNotNull('suppress_etd', instance.suppressEtd);
  writeNotNull('tax_id_expiration_date',
      dateTimeToStringDDMMYYYY(instance.taxIdExpirationDate));
  return val;
}

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
      json['bill_receiver_amount'] as String?,
      json['bill_receiver_postal_code'] as String?,
      json['bill_third_party_account'] as String?,
      json['bill_third_party_country'] as String?,
      json['bill_third_party_postal_code'] as String?,
      json['by_drone'] as bool?,
      json['carbon_neutral'] as bool?,
      json['carrier_insurance_amount'] as String?,
      json['carrier_notification_email'] as String?,
      json['carrier_notification_sms'] as String?,
      json['certified_mail'] as bool?,
      json['cod_address_id'] as String?,
      json['cod_amount'] as String?,
      json['cod_method'] as String?,
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
      json['delivery_confirmation'] as String?,
      json['delivery_time_preference'] as String?,
      json['dropoff_max_datetime'] == null
          ? null
          : DateTime.parse(json['dropoff_max_datetime'] as String),
      json['dropoff_type'] as String?,
      json['dry_ice'] as bool?,
      json['dry_ice_medical'] as bool?,
      json['dry_ice_weight'] as String?,
      json['duty_payment'] as Map<String, dynamic>?,
      json['duty_payment_account'] as String?,
      json['endorsement'] as String?,
      json['end_shipper_id'] as String?,
      json['freight_charge'] as String?,
      json['group'] as String?,
      json['handling_instructions'] as String?,
      json['hazmat'] as String?,
      json['hold_for_pickup'] as bool?,
      json['image_format'] as String?,
      json['importer_address_id'] as String?,
      json['import_federal_tax_id'] as String?,
      json['import_state_tax_id'] as String?,
      json['incoterm'] as String?,
      json['invoice_number'] as String?,
      json['label_date'] == null
          ? null
          : DateTime.parse(json['label_date'] as String),
      json['label_format'] as String?,
      json['label_size'] as String?,
      json['license_number'] as String?,
      json['machinable'] as String?,
      json['neutral_delivery'] as bool?,
      json['non_contact'] as bool?,
      json['overlabel_construct_code'] as String?,
      json['overlabel_construct_tracking_number'] as String?,
      json['parties_to_transaction_are_related'] as String?,
      json['payment'] as Map<String, dynamic>?,
      json['peel_and_return'] as bool?,
      json['pickup_max_datetime'] == null
          ? null
          : DateTime.parse(json['pickup_max_datetime'] as String),
      json['pickup_min_datetime'] == null
          ? null
          : DateTime.parse(json['pickup_min_datetime'] as String),
      json['po_sort'] as String?,
      json['postage_label_inline'] as bool?,
      (json['print_custom'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      json['print_custom_1'] as String?,
      json['print_custom_1_barcode'] as bool?,
      json['print_custom_1_code'] as String?,
      json['print_custom_2'] as String?,
      json['print_custom_2_barcode'] as bool?,
      json['print_custom_2_code'] as String?,
      json['print_custom_3'] as String?,
      json['print_custom_3_barcode'] as bool?,
      json['print_custom_3_code'] as String?,
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
    );

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
  writeNotNull('bill_receiver_amount', instance.billReceiverAmount);
  writeNotNull('bill_receiver_postal_code', instance.billReceiverPostalCode);
  writeNotNull('bill_third_party_account', instance.billThirdPartyAccount);
  writeNotNull('bill_third_party_country', instance.billThirdPartyCountry);
  writeNotNull(
      'bill_third_party_postal_code', instance.billThirdPartyPostalCode);
  writeNotNull('by_drone', instance.deliverByDrone);
  writeNotNull('carbon_neutral', instance.enableCarbonNeutral);
  writeNotNull('carrier_insurance_amount', instance.carrierInsuranceAmount);
  writeNotNull('carrier_notification_email', instance.carrierNotificationEmail);
  writeNotNull('carrier_notification_sms', instance.carrierNotificationSms);
  writeNotNull('certified_mail', instance.useCertifiedMail);
  writeNotNull('cod_address_id', instance.codAddressId);
  writeNotNull('cod_amount', instance.codAmount);
  writeNotNull('cod_method', instance.codMethod);
  writeNotNull('commercial_invoice_format', instance.commercialInvoiceFormat);
  writeNotNull(
      'commercial_invoice_letterhead', instance.commercialInvoiceLetterhead);
  writeNotNull(
      'commercial_invoice_signature', instance.commercialInvoiceSignature);
  writeNotNull('commercial_invoice_size', instance.commercialInvoiceSize);
  writeNotNull('cost_center', instance.costCenter);
  writeNotNull('currency', instance.currency);
  writeNotNull('customs_broker_address_id', instance.customsBrokerAddressId);
  writeNotNull('customs_include_shipping', instance.customsIncludeShipping);
  writeNotNull('declared_value', instance.declaredValue);
  writeNotNull('delivered_duty_paid', instance.deliveredDutyPaid);
  writeNotNull('delivery_confirmation', instance.deliveryConfirmation);
  writeNotNull('delivery_time_preference', instance.deliveryTimePreference);
  writeNotNull(
      'dropoff_max_datetime', instance.dropoffMaxDatetime?.toIso8601String());
  writeNotNull('dropoff_type', instance.dropoffType);
  writeNotNull('dry_ice', instance.isDryIce);
  writeNotNull('dry_ice_medical', instance.isDryIceMedical);
  writeNotNull('dry_ice_weight', instance.dryIceWeight);
  writeNotNull('duty_payment', instance.dutyPayment);
  writeNotNull('duty_payment_account', instance.dutyPaymentAccount);
  writeNotNull('endorsement', instance.endorsement);
  writeNotNull('end_shipper_id', instance.endShipperId);
  writeNotNull('freight_charge', instance.freightCharge);
  writeNotNull('group', instance.group);
  writeNotNull('handling_instructions', instance.handlingInstructions);
  writeNotNull('hazmat', instance.hazmat);
  writeNotNull('hold_for_pickup', instance.holdForPickup);
  writeNotNull('image_format', instance.imageFormat);
  writeNotNull('importer_address_id', instance.importerAddressId);
  writeNotNull('import_federal_tax_id', instance.importFederalTaxId);
  writeNotNull('import_state_tax_id', instance.importStateTaxId);
  writeNotNull('incoterm', instance.incoterm);
  writeNotNull('invoice_number', instance.invoiceNumber);
  writeNotNull('label_date', instance.labelDate?.toIso8601String());
  writeNotNull('label_format', instance.labelFormat);
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
  writeNotNull('payment', instance.payment);
  writeNotNull('peel_and_return', instance.enablePeelAndReturn);
  writeNotNull(
      'pickup_max_datetime', instance.pickupMaxDatetime?.toIso8601String());
  writeNotNull(
      'pickup_min_datetime', instance.pickupMinDatetime?.toIso8601String());
  writeNotNull('po_sort', instance.poSort);
  writeNotNull('postage_label_inline', instance.postageLabelInline);
  writeNotNull('print_custom', instance.printCustom);
  writeNotNull('print_custom_1', instance.printCustom1);
  writeNotNull('print_custom_1_barcode', instance.includePrintCustom1Barcode);
  writeNotNull('print_custom_1_code', instance.printCustom1Code);
  writeNotNull('print_custom_2', instance.printCustom2);
  writeNotNull('print_custom_2_barcode', instance.includePrintCustom2Barcode);
  writeNotNull('print_custom_2_code', instance.printCustom2Code);
  writeNotNull('print_custom_3', instance.printCustom3);
  writeNotNull('print_custom_3_barcode', instance.includePrintCustom3Barcode);
  writeNotNull('print_custom_3_code', instance.printCustom3Code);
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
  return val;
}

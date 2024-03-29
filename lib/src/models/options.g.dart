// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DangerousGood _$DangerousGoodFromJson(Map<String, dynamic> json) =>
    DangerousGood(
      allInOne: json['all_in_one'] as bool?,
      containerType: json['container_type'] as String?,
      exceedsReportableQuantity: json['exceeds_reportable_quantity'] as bool?,
      hazardClass: json['hazard_class'] as String?,
      hazardId: json['hazard_id'] as String?,
      hazardType: json['hazard_type'] as String?,
      itemQuantity: stringToInt(json['item_quantity'] as String?),
      itemUnit: json['item_unit'] as String?,
      labelType: hazmatLabelTypeFromJson(json['label_type'] as String?),
      numberOfContainers: stringToInt(json['number_of_containers'] as String?),
      overpackPackaging: json['overpack_packaging'] as String?,
      overpack: json['overpack'] as bool?,
      packingGroup: json['packing_group'] as String?,
      packingInstructionsCode: json['packing_instructions_code'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
      points: json['points'] as int?,
      properName: json['proper_name'] as String?,
      qValue: (json['q_value'] as num?)?.toDouble(),
      sequenceNumber: json['sequence_number'] as String?,
      subsidiaryRiskClass: json['subsidiary_risk_class'] as String?,
      technicalName: json['technical_name'] as String?,
      transportationCategory: json['transportation_category'] as int?,
      tunnelCode: json['tunnel_code'] as String?,
    );

Map<String, dynamic> _$DangerousGoodToJson(DangerousGood instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('all_in_one', instance.allInOne);
  writeNotNull('container_type', instance.containerType);
  writeNotNull(
      'exceeds_reportable_quantity', instance.exceedsReportableQuantity);
  writeNotNull('hazard_class', instance.hazardClass);
  writeNotNull('hazard_id', instance.hazardId);
  writeNotNull('hazard_type', instance.hazardType);
  writeNotNull('item_quantity', intToString(instance.itemQuantity));
  writeNotNull('item_unit', instance.itemUnit);
  writeNotNull('label_type', hazmatLabelTypeToJson(instance.labelType));
  writeNotNull(
      'number_of_containers', intToString(instance.numberOfContainers));
  writeNotNull('overpack_packaging', instance.overpackPackaging);
  writeNotNull('overpack', instance.overpack);
  writeNotNull('packing_group', instance.packingGroup);
  writeNotNull('packing_instructions_code', instance.packingInstructionsCode);
  writeNotNull('percentage', instance.percentage);
  writeNotNull('points', instance.points);
  writeNotNull('proper_name', instance.properName);
  writeNotNull('q_value', instance.qValue);
  writeNotNull('sequence_number', instance.sequenceNumber);
  writeNotNull('subsidiary_risk_class', instance.subsidiaryRiskClass);
  writeNotNull('technical_name', instance.technicalName);
  writeNotNull('transportation_category', instance.transportationCategory);
  writeNotNull('tunnel_code', instance.tunnelCode);
  return val;
}

DangerousGoodsDetails _$DangerousGoodsDetailsFromJson(
        Map<String, dynamic> json) =>
    DangerousGoodsDetails(
      accessibility: json['accessibility'] as String?,
      authorizationCode: json['authorization_code'] as String?,
      cargoAircraftOnly: json['cargo_aircraft_only'] as bool?,
      consigneeIdentifier: json['consignee_identifier'] as String?,
      dangerousGoodsItems: (json['dangerous_goods_items'] as List<dynamic>?)
          ?.map((e) => DangerousGood.fromJson(e as Map<String, dynamic>))
          .toList(),
      emergencyContact: json['emergency_contact'] as String?,
      excepted: json['excepted'] as bool?,
      regulationSet: json['regulation_set'] as String?,
      signatoryLocation: json['signatory_location'] as String?,
      signatoryTitle: json['signatory_title'] as String?,
      signatory: json['signatory'] as String?,
      transportationMode: json['transportation_mode'] as String?,
    );

Map<String, dynamic> _$DangerousGoodsDetailsToJson(
    DangerousGoodsDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('accessibility', instance.accessibility);
  writeNotNull('authorization_code', instance.authorizationCode);
  writeNotNull('cargo_aircraft_only', instance.cargoAircraftOnly);
  writeNotNull('consignee_identifier', instance.consigneeIdentifier);
  writeNotNull('dangerous_goods_items',
      instance.dangerousGoodsItems?.map((e) => e.toJson()).toList());
  writeNotNull('emergency_contact', instance.emergencyContact);
  writeNotNull('excepted', instance.excepted);
  writeNotNull('regulation_set', instance.regulationSet);
  writeNotNull('signatory_location', instance.signatoryLocation);
  writeNotNull('signatory_title', instance.signatoryTitle);
  writeNotNull('signatory', instance.signatory);
  writeNotNull('transportation_mode', instance.transportationMode);
  return val;
}

Options _$OptionsFromJson(Map<String, dynamic> json) => Options(
      additionalHandling: json['additional_handling'] as bool?,
      addressValidationLevel: json['address_validation_level'] as String?,
      isAlcohol: json['alcohol'] as bool?,
      billingRef: json['billing_ref'] as String?,
      deliverByDrone: json['by_drone'] as bool?,
      carrierInsuranceAmount: json['carrier_insurance_amount'] as String?,
      carrierNotificationEmail: json['carrier_notification_email'] as String?,
      carrierNotificationSms: json['carrier_notification_sms'] as String?,
      useCertifiedMail: json['certified_mail'] as bool?,
      codAddressId: json['cod_address_id'] as String?,
      codAmount: json['cod_amount'] as String?,
      codMethod: codMethodFromJson(json['cod_method'] as String?),
      commercialInvoiceFormat: json['commercial_invoice_format'] as String?,
      commercialInvoiceLetterhead:
          json['commercial_invoice_letterhead'] as String?,
      commercialInvoiceSignature:
          json['commercial_invoice_signature'] as String?,
      commercialInvoiceSize: json['commercial_invoice_size'] as String?,
      costCenter: json['cost_center'] as String?,
      currency: json['currency'] as String?,
      customsBrokerAddressId: json['customs_broker_address_id'] as String?,
      customsIncludeShipping: json['customs_include_shipping'] as bool?,
      declaredValue: json['declared_value'] as String?,
      deliveredDutyPaid: json['delivered_duty_paid'] as bool?,
      deliveryConfirmation: deliveryConfirmationFromJson(
          json['delivery_confirmation'] as String?),
      deliveryTimePreference: json['delivery_time_preference'] as String?,
      dropoffMaxDatetime:
          stringToDateTime(json['dropoff_max_datetime'] as String?),
      dropoffType: dropOffTypeFromJson(json['dropoff_type'] as String?),
      isDryIce: json['dry_ice'] as bool?,
      isDryIceMedical: json['dry_ice_medical'] as bool?,
      dryIceWeight: json['dry_ice_weight'] as String?,
      dutyPayment: json['duty_payment'] == null
          ? null
          : PaymentOptions.fromJson(
              json['duty_payment'] as Map<String, dynamic>),
      dutyPaymentAccount: json['duty_payment_account'] as String?,
      endorsement: endorsementFromJson(json['endorsement'] as String?),
      endShipperId: json['end_shipper_id'] as String?,
      freightCharge: json['freight_charge'] as String?,
      group: json['group'] as String?,
      handlingInstructions: json['handling_instructions'] as String?,
      hazmat: hazmatTypeFromJson(json['hazmat'] as String?),
      holdForPickup: json['hold_for_pickup'] as bool?,
      imageFormat: json['image_format'] as String?,
      importerAddressId: json['importer_address_id'] as String?,
      importFederalTaxId: json['import_federal_tax_id'] as String?,
      importStateTaxId: json['import_state_tax_id'] as String?,
      incoterm: incotermTypeFromJson(json['incoterm'] as String?),
      invoiceNumber: json['invoice_number'] as String?,
      labelDate: stringToDateTime(json['label_date'] as String?),
      labelFormat: labelFormatFromJson(json['label_format'] as String?),
      labelSize: json['label_size'] as String?,
      licenseNumber: json['license_number'] as String?,
      machinable: json['machinable'] as String?,
      enableNeutralDelivery: json['neutral_delivery'] as bool?,
      enableNonContact: json['non_contact'] as bool?,
      overlabelConstructCode: json['overlabel_construct_code'] as String?,
      overlabelConstructTrackingNumber:
          json['overlabel_construct_tracking_number'] as String?,
      partiesToTransactionAreRelated:
          json['parties_to_transaction_are_related'] as String?,
      payment: json['payment'] == null
          ? null
          : PaymentOptions.fromJson(json['payment'] as Map<String, dynamic>),
      enablePeelAndReturn: json['peel_and_return'] as bool?,
      pickupMaxDatetime:
          stringToDateTime(json['pickup_max_datetime'] as String?),
      pickupMinDatetime:
          stringToDateTime(json['pickup_min_datetime'] as String?),
      poSort: json['po_sort'] as String?,
      postageLabelInline: json['postage_label_inline'] as bool?,
      printCustom: (json['print_custom'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      printCustomMessage1: json['print_custom_1'] as String?,
      includePrintCustomBarcode1: json['print_custom_1_barcode'] as bool?,
      printCustomCode1:
          printCustomCodeFromJson(json['print_custom_1_code'] as String?),
      printCustomMessage2: json['print_custom_2'] as String?,
      includePrintCustomBarcode2: json['print_custom_2_barcode'] as bool?,
      printCustomCode2:
          printCustomCodeFromJson(json['print_custom_2_code'] as String?),
      printCustomMessage3: json['print_custom_3'] as String?,
      includePrintCustomBarcode3: json['print_custom_3_barcode'] as bool?,
      printCustomCode3:
          printCustomCodeFromJson(json['print_custom_3_code'] as String?),
      includePrintRate: json['print_rate'] as bool?,
      receiverLiquorLicense: json['receiver_liquor_license'] as String?,
      useRegisteredMail: json['registered_mail'] as bool?,
      registeredMailAmount:
          (json['registered_mail_amount'] as num?)?.toDouble(),
      includeReturnReceipt: json['return_receipt'] as bool?,
      returnService: json['return_service'] as String?,
      enableSaturdayDelivery: json['saturday_delivery'] as bool?,
      settlementMethod: json['settlement_method'] as String?,
      smartpostHub: json['smartpost_hub'] as String?,
      smartpostManifest: json['smartpost_manifest'] as String?,
      specialRatesEligibility: json['special_rates_eligibility'] as String?,
      suppressEtd: json['suppress_etd'] as bool?,
      taxIdExpirationDate:
          stringToDateTime(json['tax_id_expiration_date'] as String?),
    )
      ..contentDescription = json['content_description'] as String?
      ..dangerousGoods = json['dangerous_goods'] == null
          ? null
          : DangerousGoodsDetails.fromJson(
              json['dangerous_goods'] as Map<String, dynamic>)
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
  writeNotNull('dangerous_goods', instance.dangerousGoods?.toJson());
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

import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'options.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class Options extends Model {
  @JsonKey(name: 'additional_handling')
  late bool? additionalHandling;

  @JsonKey(name: 'address_validation_level')
  late String? addressValidationLevel;

  @JsonKey(name: 'alcohol')
  late bool? isAlcohol;

  @JsonKey(name: 'billing_ref')
  late String? billingRef;

  @JsonKey(name: 'bill_receiver_amount')
  late String? billReceiverAmount;

  @JsonKey(name: 'bill_receiver_postal_code')
  late String? billReceiverPostalCode;

  @JsonKey(name: 'bill_third_party_account')
  late String? billThirdPartyAccount;

  @JsonKey(name: 'bill_third_party_country')
  late String? billThirdPartyCountry;

  @JsonKey(name: 'bill_third_party_postal_code')
  late String? billThirdPartyPostalCode;

  @JsonKey(name: 'by_drone')
  late bool? deliverByDrone;

  @JsonKey(name: 'carbon_neutral')
  late bool? enableCarbonNeutral;

  @JsonKey(name: 'carrier_insurance_amount')
  late String? carrierInsuranceAmount;

  @JsonKey(name: 'carrier_notification_email')
  late String? carrierNotificationEmail;

  @JsonKey(name: 'carrier_notification_sms')
  late String? carrierNotificationSms;

  @JsonKey(name: 'certified_mail')
  late bool? useCertifiedMail;

  @JsonKey(name: 'cod_address_id')
  late String? codAddressId;

  @JsonKey(name: 'cod_amount')
  late String? codAmount;

  @JsonKey(name: 'cod_method')
  late String? codMethod;

  @JsonKey(name: 'commercial_invoice_format')
  late String? commercialInvoiceFormat;

  @JsonKey(name: 'commercial_invoice_letterhead')
  late String? commercialInvoiceLetterhead;

  @JsonKey(name: 'commercial_invoice_signature')
  late String? commercialInvoiceSignature;

  @JsonKey(name: 'commercial_invoice_size')
  late String? commercialInvoiceSize;

  @JsonKey(name: 'cost_center')
  late String? costCenter;

  @JsonKey(name: 'currency')
  late String? currency;

  @JsonKey(name: 'customs_broker_address_id')
  late String? customsBrokerAddressId;

  @JsonKey(name: 'customs_include_shipping')
  late bool? customsIncludeShipping;

  @JsonKey(name: 'declared_value')
  late String? declaredValue;

  @JsonKey(name: 'delivered_duty_paid')
  late bool? deliveredDutyPaid;

  @JsonKey(name: 'delivery_confirmation')
  late String? deliveryConfirmation;

  @JsonKey(name: 'delivery_time_preference')
  late String? deliveryTimePreference;

  @JsonKey(name: 'dropoff_max_datetime')
  late DateTime? dropoffMaxDatetime;

  @JsonKey(name: 'dropoff_type')
  late String? dropoffType;

  @JsonKey(name: 'dry_ice')
  late bool? isDryIce;

  @JsonKey(name: 'dry_ice_medical')
  late bool? isDryIceMedical;

  @JsonKey(name: 'dry_ice_weight')
  late String? dryIceWeight;

  @JsonKey(name: 'duty_payment')
  late Map<String, dynamic>? dutyPayment;

  @JsonKey(name: 'duty_payment_account')
  late String? dutyPaymentAccount;

  @JsonKey(name: 'endorsement')
  late String? endorsement;

  @JsonKey(name: 'end_shipper_id')
  late String? endShipperId;

  @JsonKey(name: 'freight_charge')
  late String? freightCharge;

  @JsonKey(name: 'group')
  late String? group;

  @JsonKey(name: 'handling_instructions')
  late String? handlingInstructions;

  @JsonKey(name: 'hazmat')
  late String? hazmat;

  @JsonKey(name: 'hold_for_pickup')
  late bool? holdForPickup;

  @JsonKey(name: 'image_format')
  late String? imageFormat;

  @JsonKey(name: 'importer_address_id')
  late String? importerAddressId;

  @JsonKey(name: 'import_federal_tax_id')
  late String? importFederalTaxId;

  @JsonKey(name: 'import_state_tax_id')
  late String? importStateTaxId;

  @JsonKey(name: 'incoterm')
  late String? incoterm;

  @JsonKey(name: 'invoice_number')
  late String? invoiceNumber;

  @JsonKey(name: 'label_date')
  late DateTime? labelDate;

  @JsonKey(name: 'label_format')
  late String? labelFormat;

  @JsonKey(name: 'label_size')
  late String? labelSize;

  @JsonKey(name: 'license_number')
  late String? licenseNumber;

  @JsonKey(name: 'machinable')
  late String? machinable;

  @JsonKey(name: 'neutral_delivery')
  late bool? enableNeutralDelivery;

  @JsonKey(name: 'non_contact')
  late bool? enableNonContact;

  @JsonKey(name: 'overlabel_construct_code')
  late String? overlabelConstructCode;

  @JsonKey(name: 'overlabel_construct_tracking_number')
  late String? overlabelConstructTrackingNumber;

  @JsonKey(name: 'parties_to_transaction_are_related')
  late String? partiesToTransactionAreRelated;

  @JsonKey(name: 'payment')
  late Map<String, dynamic>? payment;

  @JsonKey(name: 'peel_and_return')
  late bool? enablePeelAndReturn;

  @JsonKey(name: 'pickup_max_datetime')
  late DateTime? pickupMaxDatetime;

  @JsonKey(name: 'pickup_min_datetime')
  late DateTime? pickupMinDatetime;

  @JsonKey(name: 'po_sort')
  late String? poSort;

  @JsonKey(name: 'postage_label_inline')
  late bool? postageLabelInline;

  @JsonKey(name: 'print_custom')
  late List<Map<String, dynamic>>? printCustom;

  @JsonKey(name: 'print_custom_1')
  late String? printCustom1;

  @JsonKey(name: 'print_custom_1_barcode')
  late bool? includePrintCustom1Barcode;

  @JsonKey(name: 'print_custom_1_code')
  late String? printCustom1Code;

  @JsonKey(name: 'print_custom_2')
  late String? printCustom2;

  @JsonKey(name: 'print_custom_2_barcode')
  late bool? includePrintCustom2Barcode;

  @JsonKey(name: 'print_custom_2_code')
  late String? printCustom2Code;

  @JsonKey(name: 'print_custom_3')
  late String? printCustom3;

  @JsonKey(name: 'print_custom_3_barcode')
  late bool? includePrintCustom3Barcode;

  @JsonKey(name: 'print_custom_3_code')
  late String? printCustom3Code;

  @JsonKey(name: 'print_rate')
  late bool? includePrintRate;

  @JsonKey(name: 'receiver_liquor_license')
  late String? receiverLiquorLicense;

  @JsonKey(name: 'registered_mail')
  late bool? useRegisteredMail;

  @JsonKey(name: 'registered_mail_amount')
  late double? registeredMailAmount;

  @JsonKey(name: 'return_receipt')
  late bool? includeReturnReceipt;

  @JsonKey(name: 'return_service')
  late String? returnService;

  @JsonKey(name: 'saturday_delivery')
  late bool? enableSaturdayDelivery;

  @JsonKey(name: 'settlement_method')
  late String? settlementMethod;

  @JsonKey(name: 'smartpost_hub')
  late String? smartpostHub;

  @JsonKey(name: 'smartpost_manifest')
  late String? smartpostManifest;

  @JsonKey(name: 'special_rates_eligibility')
  late String? specialRatesEligibility;

  @JsonKey(name: 'suppress_etd')
  late bool? suppressEtd;

  Options([
    objectType,
    mode,
    this.additionalHandling,
    this.addressValidationLevel,
    this.isAlcohol,
    this.billingRef,
    this.billReceiverAmount,
    this.billReceiverPostalCode,
    this.billThirdPartyAccount,
    this.billThirdPartyCountry,
    this.billThirdPartyPostalCode,
    this.deliverByDrone,
    this.enableCarbonNeutral,
    this.carrierInsuranceAmount,
    this.carrierNotificationEmail,
    this.carrierNotificationSms,
    this.useCertifiedMail,
    this.codAddressId,
    this.codAmount,
    this.codMethod,
    this.commercialInvoiceFormat,
    this.commercialInvoiceLetterhead,
    this.commercialInvoiceSignature,
    this.commercialInvoiceSize,
    this.costCenter,
    this.currency,
    this.customsBrokerAddressId,
    this.customsIncludeShipping,
    this.declaredValue,
    this.deliveredDutyPaid,
    this.deliveryConfirmation,
    this.deliveryTimePreference,
    this.dropoffMaxDatetime,
    this.dropoffType,
    this.isDryIce,
    this.isDryIceMedical,
    this.dryIceWeight,
    this.dutyPayment,
    this.dutyPaymentAccount,
    this.endorsement,
    this.endShipperId,
    this.freightCharge,
    this.group,
    this.handlingInstructions,
    this.hazmat,
    this.holdForPickup,
    this.imageFormat,
    this.importerAddressId,
    this.importFederalTaxId,
    this.importStateTaxId,
    this.incoterm,
    this.invoiceNumber,
    this.labelDate,
    this.labelFormat,
    this.labelSize,
    this.licenseNumber,
    this.machinable,
    this.enableNeutralDelivery,
    this.enableNonContact,
    this.overlabelConstructCode,
    this.overlabelConstructTrackingNumber,
    this.partiesToTransactionAreRelated,
    this.payment,
    this.enablePeelAndReturn,
    this.pickupMaxDatetime,
    this.pickupMinDatetime,
    this.poSort,
    this.postageLabelInline,
    this.printCustom,
    this.printCustom1,
    this.includePrintCustom1Barcode,
    this.printCustom1Code,
    this.printCustom2,
    this.includePrintCustom2Barcode,
    this.printCustom2Code,
    this.printCustom3,
    this.includePrintCustom3Barcode,
    this.printCustom3Code,
    this.includePrintRate,
    this.receiverLiquorLicense,
    this.useRegisteredMail,
    this.registeredMailAmount,
    this.includeReturnReceipt,
    this.returnService,
    this.enableSaturdayDelivery,
    this.settlementMethod,
    this.smartpostHub,
    this.smartpostManifest,
    this.specialRatesEligibility,
    this.suppressEtd,
  ]) : super(objectType, mode);

  factory Options.fromJson(Map<String, dynamic> input) =>
      _$OptionsFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

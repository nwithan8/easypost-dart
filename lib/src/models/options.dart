import 'package:easypost/src/base/model.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:json_annotation/json_annotation.dart';

part 'options.g.dart';

@JsonSerializable(explicitToJson: true)
class Options extends Model {
  @JsonKey(name: 'additional_handling')
  final bool? additionalHandling;

  @JsonKey(name: 'address_validation_level')
  final String? addressValidationLevel;

  @JsonKey(name: 'alcohol')
  final bool? isAlcohol;

  @JsonKey(name: 'billing_ref')
  final String? billingRef;

  @JsonKey(name: 'bill_receiver_amount')
  final String? billReceiverAmount;

  @JsonKey(name: 'bill_receiver_postal_code')
  final String? billReceiverPostalCode;

  @JsonKey(name: 'bill_third_party_account')
  final String? billThirdPartyAccount;

  @JsonKey(name: 'bill_third_party_country')
  final String? billThirdPartyCountry;

  @JsonKey(name: 'bill_third_party_postal_code')
  final String? billThirdPartyPostalCode;

  @JsonKey(name: 'by_drone')
  final bool? deliverByDrone;

  @JsonKey(name: 'carbon_neutral')
  final bool? enableCarbonNeutral;

  @JsonKey(name: 'carrier_insurance_amount')
  final String? carrierInsuranceAmount;

  @JsonKey(name: 'carrier_notification_email')
  final String? carrierNotificationEmail;

  @JsonKey(name: 'carrier_notification_sms')
  final String? carrierNotificationSms;

  @JsonKey(name: 'certified_mail')
  final bool? useCertifiedMail;

  @JsonKey(name: 'cod_address_id')
  final String? codAddressId;

  @JsonKey(name: 'cod_amount')
  final String? codAmount;

  @JsonKey(name: 'cod_method')
  final String? codMethod;

  @JsonKey(name: 'commercial_invoice_format')
  final String? commercialInvoiceFormat;

  @JsonKey(name: 'commercial_invoice_letterhead')
  final String? commercialInvoiceLetterhead;

  @JsonKey(name: 'commercial_invoice_signature')
  final String? commercialInvoiceSignature;

  @JsonKey(name: 'commercial_invoice_size')
  final String? commercialInvoiceSize;

  @JsonKey(name: 'cost_center')
  final String? costCenter;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'customs_broker_address_id')
  final String? customsBrokerAddressId;

  @JsonKey(name: 'customs_include_shipping')
  final bool? customsIncludeShipping;

  @JsonKey(name: 'declared_value')
  final String? declaredValue;

  @JsonKey(name: 'delivered_duty_paid')
  final bool? deliveredDutyPaid;

  @JsonKey(name: 'delivery_confirmation')
  final String? deliveryConfirmation;

  @JsonKey(name: 'delivery_time_preference')
  final String? deliveryTimePreference;

  @JsonKey(name: 'dropoff_max_datetime')
  final DateTime? dropoffMaxDatetime;

  @JsonKey(name: 'dropoff_type')
  final String? dropoffType;

  @JsonKey(name: 'dry_ice')
  final bool? isDryIce;

  @JsonKey(name: 'dry_ice_medical')
  final bool? isDryIceMedical;

  @JsonKey(name: 'dry_ice_weight')
  final String? dryIceWeight;

  @JsonKey(name: 'duty_payment')
  final Map<String, dynamic>? dutyPayment;

  @JsonKey(name: 'duty_payment_account')
  final String? dutyPaymentAccount;

  @JsonKey(name: 'endorsement')
  final String? endorsement;

  @JsonKey(name: 'end_shipper_id')
  final String? endShipperId;

  @JsonKey(name: 'freight_charge')
  final String? freightCharge;

  @JsonKey(name: 'group')
  final String? group;

  @JsonKey(name: 'handling_instructions')
  final String? handlingInstructions;

  @JsonKey(name: 'hazmat')
  final String? hazmat;

  @JsonKey(name: 'hold_for_pickup')
  final bool? holdForPickup;

  @JsonKey(name: 'image_format')
  final String? imageFormat;

  @JsonKey(name: 'importer_address_id')
  final String? importerAddressId;

  @JsonKey(name: 'import_federal_tax_id')
  final String? importFederalTaxId;

  @JsonKey(name: 'import_state_tax_id')
  final String? importStateTaxId;

  @JsonKey(name: 'incoterm')
  final String? incoterm;

  @JsonKey(name: 'invoice_number')
  final String? invoiceNumber;

  @JsonKey(name: 'label_date')
  final DateTime? labelDate;

  @JsonKey(name: 'label_format')
  final String? labelFormat;

  @JsonKey(name: 'label_size')
  final String? labelSize;

  @JsonKey(name: 'license_number')
  final String? licenseNumber;

  @JsonKey(name: 'machinable')
  final String? machinable;

  @JsonKey(name: 'neutral_delivery')
  final bool? enableNeutralDelivery;

  @JsonKey(name: 'non_contact')
  final bool? enableNonContact;

  @JsonKey(name: 'overlabel_construct_code')
  final String? overlabelConstructCode;

  @JsonKey(name: 'overlabel_construct_tracking_number')
  final String? overlabelConstructTrackingNumber;

  @JsonKey(name: 'parties_to_transaction_are_related')
  final String? partiesToTransactionAreRelated;

  @JsonKey(name: 'payment')
  final Map<String, dynamic>? payment;

  @JsonKey(name: 'peel_and_return')
  final bool? enablePeelAndReturn;

  @JsonKey(name: 'pickup_max_datetime')
  final DateTime? pickupMaxDatetime;

  @JsonKey(name: 'pickup_min_datetime')
  final DateTime? pickupMinDatetime;

  @JsonKey(name: 'po_sort')
  final String? poSort;

  @JsonKey(name: 'postage_label_inline')
  final bool? postageLabelInline;

  @JsonKey(name: 'print_custom')
  final List<Map<String, dynamic>> printCustom;

  @JsonKey(name: 'print_custom_1')
  final String? printCustom1;

  @JsonKey(name: 'print_custom_1_barcode')
  final bool? includePrintCustom1Barcode;

  @JsonKey(name: 'print_custom_1_code')
  final String? printCustom1Code;

  @JsonKey(name: 'print_custom_2')
  final String? printCustom2;

  @JsonKey(name: 'print_custom_2_barcode')
  final bool? includePrintCustom2Barcode;

  @JsonKey(name: 'print_custom_2_code')
  final String? printCustom2Code;

  @JsonKey(name: 'print_custom_3')
  final String? printCustom3;

  @JsonKey(name: 'print_custom_3_barcode')
  final bool? includePrintCustom3Barcode;

  @JsonKey(name: 'print_custom_3_code')
  final String? printCustom3Code;

  @JsonKey(name: 'print_rate')
  final bool? includePrintRate;

  @JsonKey(name: 'receiver_liquor_license')
  final String? receiverLiquorLicense;

  @JsonKey(name: 'registered_mail')
  final bool? useRegisteredMail;

  @JsonKey(name: 'registered_mail_amount')
  final double? registeredMailAmount;

  @JsonKey(name: 'return_receipt')
  final bool? includeReturnReceipt;

  @JsonKey(name: 'return_service')
  final String? returnService;

  @JsonKey(name: 'saturday_delivery')
  final bool? enableSaturdayDelivery;

  @JsonKey(name: 'settlement_method')
  final String? settlementMethod;

  @JsonKey(name: 'smartpost_hub')
  final String? smartpostHub;

  @JsonKey(name: 'smartpost_manifest')
  final String? smartpostManifest;

  @JsonKey(name: 'special_rates_eligibility')
  final String? specialRatesEligibility;

  @JsonKey(name: 'suppress_etd')
  final bool? suppressEtd;

  Options(
    id,
    createdAt,
    updatedAt,
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
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Options.fromJson(Map<String, dynamic> input) =>
      _$OptionsFromJson(input);

  Map<String, dynamic> toJson() => _$OptionsToJson(this);
}

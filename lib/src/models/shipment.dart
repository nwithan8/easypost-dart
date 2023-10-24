import 'package:easypost/src/base/collection.dart';
import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/fee.dart';
import 'package:easypost/src/models/form.dart';
import 'package:easypost/src/models/message.dart';
import 'package:easypost/src/models/options.dart';
import 'package:easypost/src/models/parcel.dart';
import 'package:easypost/src/models/postage_label.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/models/scan_form.dart';
import 'package:easypost/src/models/tax_identifier.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment.g.dart';

@JsonSerializable(explicitToJson: true)
class Shipment extends ModelWithId {
  @JsonKey(name: 'batch_id')
  final String? batchId;

  @JsonKey(name: 'batch_message')
  final String? batchMessage;

  @JsonKey(name: 'batch_status')
  final String? batchStatus;

  @JsonKey(name: 'buyer_address')
  final Address? buyerAddress;

  @JsonKey(name: 'carrier_accounts')
  final List<CarrierAccount>? carrierAccounts;

  @JsonKey(name: 'customs_info')
  final CustomsInfo? customsInfo;

  @JsonKey(name: 'fees')
  final List<Fee>? fees;

  @JsonKey(name: 'forms')
  final List<Form>? forms;

  @JsonKey(name: 'from_address')
  final Address? fromAddress;

  @JsonKey(name: 'insurance')
  final String? insurance;

  @JsonKey(name: 'is_return')
  final bool? isReturn;

  @JsonKey(name: 'messages')
  final List<Message>? messages;

  @JsonKey(name: 'options')
  final Options? options;

  @JsonKey(name: 'order_id')
  final String? orderId;

  @JsonKey(name: 'parcel')
  final Parcel? parcel;

  @JsonKey(name: 'postage_label')
  final PostageLabel? postageLabel;

  @JsonKey(name: 'rates')
  final List<Rate>? rates;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'refund_status')
  final String? refundStatus;

  @JsonKey(name: 'return_address')
  final Address? returnAddress;

  @JsonKey(name: 'scan_form')
  final ScanForm? scanForm;

  @JsonKey(name: 'selected_rate')
  final Rate? selectedRate;

  @JsonKey(name: 'service')
  final String? service;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tax_idenfifiers')
  final List<TaxIdentifier>? taxIdenfifiers;

  @JsonKey(name: 'to_address')
  final Address? toAddress;

  @JsonKey(name: 'tracker')
  final Tracker? tracker;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  @JsonKey(name: 'usps_zone')
  final String? uspsZone;

  Shipment(
      id,
      createdAt,
      updatedAt,
      objectType,
      mode,
      this.batchId,
      this.batchMessage,
      this.batchStatus,
      this.buyerAddress,
      this.carrierAccounts,
      this.customsInfo,
      this.fees,
      this.forms,
      this.fromAddress,
      this.insurance,
      this.isReturn,
      this.messages,
      this.options,
      this.orderId,
      this.parcel,
      this.postageLabel,
      this.rates,
      this.reference,
      this.refundStatus,
      this.returnAddress,
      this.scanForm,
      this.selectedRate,
      this.service,
      this.status,
      this.taxIdenfifiers,
      this.toAddress,
      this.tracker,
      this.trackingCode,
      this.uspsZone)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory Shipment.fromJson(Map<String, dynamic> input) =>
      _$ShipmentFromJson(input);

  Map<String, dynamic> toJson() => _$ShipmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ShipmentCollection extends Collection {
  @JsonKey(name: 'shipments')
  final List<Shipment>? shipments;

  ShipmentCollection(
      id, createdAt, updatedAt, objectType, mode, hasMore, this.shipments)
      : super(id, createdAt, updatedAt, objectType, mode, hasMore);

  factory ShipmentCollection.fromJson(Map<String, dynamic> input) =>
      _$ShipmentCollectionFromJson(input);

  Map<String, dynamic> toJson() => _$ShipmentCollectionToJson(this);
}

import 'package:easypost/src/api/parameters/iparameters.dart';
import 'package:easypost/src/api/parameters/v2/shipments/list_shipments.dart';
import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/base/paginated_collection.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
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
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:easypost/src/models/scan_form.dart';
import 'package:easypost/src/models/shipment_rate.dart';
import 'package:easypost/src/models/tax_identifier.dart';
import 'package:easypost/src/models/tracker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipment.g.dart';

@JsonSerializable(explicitToJson: true)
class Shipment extends ReadOnlyModelWithId implements IShipmentParameter {
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

  @JsonKey(name: 'insurance', fromJson: stringToMoney, toJson: moneyToString)
  final double? insurance;

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
  final List<ShipmentRate>? rates;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'refund_status')
  final String? refundStatus;

  @JsonKey(name: 'return_address')
  final Address? returnAddress;

  @JsonKey(name: 'scan_form')
  final ScanForm? scanForm;

  @JsonKey(name: 'selected_rate')
  final ShipmentRate? selectedRate;

  @JsonKey(name: 'service')
  final String? service;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'tax_identifiers')
  final List<TaxIdentifier>? taxIdentifiers;

  @JsonKey(name: 'to_address')
  final Address? toAddress;

  @JsonKey(name: 'tracker')
  final Tracker? tracker;

  @JsonKey(name: 'tracking_code')
  final String? trackingCode;

  @JsonKey(name: 'usps_zone')
  final int? uspsZone;

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
      this.taxIdentifiers,
      this.toAddress,
      this.tracker,
      this.trackingCode,
      this.uspsZone)
      : super(id, createdAt, updatedAt, objectType, mode);

  factory Shipment.fromJson(Map<String, dynamic> input) =>
      _$ShipmentFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ShipmentToJson(this);

  ShipmentRate? associatedShipmentRate(QuotedRate rate, {bool lockPrice = false}) {
    if (rates == null) {
      throw MissingPropertyException.generate(toString(), 'rates');
    }

    filterFunction(ShipmentRate shipmentRate) {
      if (shipmentRate.price == null) {
        return false;
      }

      if (lockPrice) {
        if (shipmentRate.price != rate.price) {
          return false;
        }
      }

      if (shipmentRate.carrier != null) {
        if (rate.carrier != null) {
          if (shipmentRate.carrier != rate.carrier) {
            return false;
          }
        }
      }

      if (shipmentRate.service != null) {
        if (rate.service != null) {
          if (shipmentRate.service != rate.service) {
            return false;
          }
        }
      }

      return true;
    }

    try {
      return rates!.firstWhere(filterFunction);
    } on StateError {
      return null;
    }
  }
}

@JsonSerializable(explicitToJson: true)
class ShipmentCollection extends PaginatedCollection<Shipment, ListShipments> {
  @JsonKey(name: 'shipments')
  final List<Shipment>? shipments;

  ShipmentCollection(objectType, mode, hasMore, this.shipments)
      : super(objectType, mode, hasMore);

  factory ShipmentCollection.fromJson(Map<String, dynamic> input) =>
      _$ShipmentCollectionFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$ShipmentCollectionToJson(this);

  @override
  ListShipments buildGetNextPageParameters(List<Shipment>? currentPageItems, {int? pageSize}) {
    ListShipments parameters = filters ?? ListShipments();

    parameters.beforeId = currentPageItems?.last.id;

    if (pageSize != null) {
      parameters.pageSize = pageSize;
    }

    return parameters;
  }
}

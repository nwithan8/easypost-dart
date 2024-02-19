import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/exceptions/missing_property_exception.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/message.dart';
import 'package:easypost/src/models/order_rate.dart';
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order extends ReadOnlyModelWithId {
  @JsonKey(name: 'buyer_address')
  final Address? buyerAddress;

  @JsonKey(name: 'carrier_accounts')
  final List<CarrierAccount>? carrierAccounts;

  @JsonKey(name: 'customs_info')
  final CustomsInfo? customsInfo;

  @JsonKey(name: 'from_address')
  final Address? fromAddress;

  @JsonKey(name: 'is_return')
  final bool? isReturn;

  @JsonKey(name: 'messages')
  final List<Message>? messages;

  @JsonKey(name: 'rates')
  final List<OrderRate>? rates;

  @JsonKey(name: 'reference')
  final String? reference;

  @JsonKey(name: 'return_address')
  final Address? returnAddress;

  @JsonKey(name: 'service')
  final String? service;

  @JsonKey(name: 'shipments')
  final List<Shipment>? shipments;

  @JsonKey(name: 'to_address')
  final Address? toAddress;

  Order(
    id,
    createdAt,
    updatedAt,
    objectType,
    mode,
    this.buyerAddress,
    this.carrierAccounts,
    this.customsInfo,
    this.fromAddress,
    this.isReturn,
    this.messages,
    this.rates,
    this.reference,
    this.returnAddress,
    this.service,
    this.shipments,
    this.toAddress,
  ) : super(id, createdAt, updatedAt, objectType, mode);

  factory Order.fromJson(Map<String, dynamic> input) => _$OrderFromJson(input);

  @override
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  OrderRate? associatedOrderRate(QuotedRate rate, {bool lockPrice = false}) {
    if (rates == null) {
      throw MissingPropertyException.generate(toString(), 'rates');
    }

    filterFunction(OrderRate orderRate) {
      if (orderRate.price == null) {
        return false;
      }

      if (lockPrice) {
        if (orderRate.price != rate.price) {
          return false;
        }
      }

      if (orderRate.carrier != null) {
        if (rate.carrier != null) {
          if (orderRate.carrier != rate.carrier) {
            return false;
          }
        }
      }

      if (orderRate.service != null) {
        if (rate.service != null) {
          if (orderRate.service != rate.service) {
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

import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/conversions.dart';
import 'package:easypost/src/models/address.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/models/customs_info.dart';
import 'package:easypost/src/models/message.dart';
import 'package:easypost/src/models/rate.dart';
import 'package:easypost/src/models/shipment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable(explicitToJson: true)
class Order extends ModelWithId {
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
  final List<Rate>? rates;

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
}

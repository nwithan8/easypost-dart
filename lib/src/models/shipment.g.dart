// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      json['id'],
      stringToDateTime(json['created_at'] as String?),
      stringToDateTime(json['updated_at'] as String?),
      json['object'],
      json['mode'],
      json['batch_id'] as String?,
      json['batch_message'] as String?,
      json['batch_status'] as String?,
      json['buyer_address'] == null
          ? null
          : Address.fromJson(json['buyer_address'] as Map<String, dynamic>),
      (json['carrier_accounts'] as List<dynamic>?)
          ?.map((e) => CarrierAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['customs_info'] == null
          ? null
          : CustomsInfo.fromJson(json['customs_info'] as Map<String, dynamic>),
      (json['fees'] as List<dynamic>?)
          ?.map((e) => Fee.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['forms'] as List<dynamic>?)
          ?.map((e) => Form.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['from_address'] == null
          ? null
          : Address.fromJson(json['from_address'] as Map<String, dynamic>),
      stringToMoney(json['insurance'] as String?),
      json['is_return'] as bool?,
      (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['options'] == null
          ? null
          : Options.fromJson(json['options'] as Map<String, dynamic>),
      json['order_id'] as String?,
      json['parcel'] == null
          ? null
          : Parcel.fromJson(json['parcel'] as Map<String, dynamic>),
      json['postage_label'] == null
          ? null
          : PostageLabel.fromJson(
              json['postage_label'] as Map<String, dynamic>),
      (json['rates'] as List<dynamic>?)
          ?.map((e) => ShipmentRate.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['reference'] as String?,
      json['refund_status'] as String?,
      json['return_address'] == null
          ? null
          : Address.fromJson(json['return_address'] as Map<String, dynamic>),
      json['scan_form'] == null
          ? null
          : ScanForm.fromJson(json['scan_form'] as Map<String, dynamic>),
      json['selected_rate'] == null
          ? null
          : ShipmentRate.fromJson(
              json['selected_rate'] as Map<String, dynamic>),
      json['service'] as String?,
      json['status'] as String?,
      (json['tax_identifiers'] as List<dynamic>?)
          ?.map((e) => TaxIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['to_address'] == null
          ? null
          : Address.fromJson(json['to_address'] as Map<String, dynamic>),
      json['tracker'] == null
          ? null
          : Tracker.fromJson(json['tracker'] as Map<String, dynamic>),
      json['tracking_code'] as String?,
      json['usps_zone'] as int?,
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'id': instance.id,
      'created_at': dateTimeToString(instance.createdAt),
      'updated_at': dateTimeToString(instance.updatedAt),
      'batch_id': instance.batchId,
      'batch_message': instance.batchMessage,
      'batch_status': instance.batchStatus,
      'buyer_address': instance.buyerAddress?.toJson(),
      'carrier_accounts':
          instance.carrierAccounts?.map((e) => e.toJson()).toList(),
      'customs_info': instance.customsInfo?.toJson(),
      'fees': instance.fees?.map((e) => e.toJson()).toList(),
      'forms': instance.forms?.map((e) => e.toJson()).toList(),
      'from_address': instance.fromAddress?.toJson(),
      'insurance': moneyToString(instance.insurance),
      'is_return': instance.isReturn,
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
      'options': instance.options?.toJson(),
      'order_id': instance.orderId,
      'parcel': instance.parcel?.toJson(),
      'postage_label': instance.postageLabel?.toJson(),
      'rates': instance.rates?.map((e) => e.toJson()).toList(),
      'reference': instance.reference,
      'refund_status': instance.refundStatus,
      'return_address': instance.returnAddress?.toJson(),
      'scan_form': instance.scanForm?.toJson(),
      'selected_rate': instance.selectedRate?.toJson(),
      'service': instance.service,
      'status': instance.status,
      'tax_identifiers':
          instance.taxIdentifiers?.map((e) => e.toJson()).toList(),
      'to_address': instance.toAddress?.toJson(),
      'tracker': instance.tracker?.toJson(),
      'tracking_code': instance.trackingCode,
      'usps_zone': instance.uspsZone,
    };

ShipmentCollection _$ShipmentCollectionFromJson(Map<String, dynamic> json) =>
    ShipmentCollection(
      json['object'],
      json['mode'],
      json['has_more'],
      (json['shipments'] as List<dynamic>?)
          ?.map((e) => Shipment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShipmentCollectionToJson(ShipmentCollection instance) =>
    <String, dynamic>{
      'object': instance.objectType,
      'mode': instance.mode,
      'has_more': instance.hasMore,
      'shipments': instance.shipments?.map((e) => e.toJson()).toList(),
    };

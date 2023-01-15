import 'dart:async';
import 'dart:convert';

import 'package:easypost/src/client_configuration.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/easypost_request.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/services.dart';

///  The Main EasyPost Client
///
///  ## Example
///
///       var client = new Client(auth: new Authentication.withToken("SomeToken"));
///       // Use the Client
///
class Client {
  /// HTTP Client
  final ClientConfiguration config;

  /// Creates a new [Client] instance.
  Client(this.config);

  /// Service for address-related methods of the EasyPost API.
  AddressService get addresses => AddressService(this);

  /// Service for API key-related methods of the EasyPost API.
  ApiKeyService get apiKeys => ApiKeyService(this);

  /// Service for batch-related methods of the EasyPost API.
  BatchService get batches => BatchService(this);

  /// Service for carrier account-related methods of the EasyPost API.
  CarrierAccountService get carrierAccounts => CarrierAccountService(this);

  /// Service for carrier type-related methods of the EasyPost API.
  CarrierTypeService get carrierTypes => CarrierTypeService(this);

  /// Service for customs info-related methods of the EasyPost API.
  CustomsInfoService get customsInfos => CustomsInfoService(this);

  /// Service for customs item-related methods of the EasyPost API.
  CustomsItemService get customsItems => CustomsItemService(this);

  /// Service for end shipper-related methods of the EasyPost API.
  EndShipperService get endShippers => EndShipperService(this);

  /// Service for event-related methods of the EasyPost API.
  EventService get events => EventService(this);

  /// Service for insurance-related methods of the EasyPost API.
  InsuranceService get insurances => InsuranceService(this);

  /// Service for order-related methods of the EasyPost API.
  OrderService get orders => OrderService(this);

  /// Service for parcel-related methods of the EasyPost API.
  ParcelService get parcels => ParcelService(this);

  /// Service for white-label partner-related methods of the EasyPost API.
  PartnerService get partners => PartnerService(this);

  /// Service for pickup-related methods of the EasyPost API.
  PickupService get pickups => PickupService(this);

  /// Service for rate-related methods of the EasyPost API.
  RateService get rates => RateService(this);

  /// Service for referral customer-related methods of the EasyPost API.
  ReferralCustomerService get referrals => ReferralCustomerService(this);

  /// Service for refund-related methods of the EasyPost API.
  RefundService get refunds => RefundService(this);

  /// Service for report-related methods of the EasyPost API.
  ReportService get reports => ReportService(this);

  /// Service for scan form-related methods of the EasyPost API.
  ScanFormService get scanForms => ScanFormService(this);

  /// Service for shipment-related methods of the EasyPost API.
  ShipmentService get shipments => ShipmentService(this);

  /// Service for tracker-related methods of the EasyPost API.
  TrackerService get trackers => TrackerService(this);

  /// Service for user-related methods of the EasyPost API.
  UserService get users => UserService(this);

  /// Service for webhook-related methods of the EasyPost API.
  WebhookService get webhooks => WebhookService(this);

  Future<bool> request(HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    try {
      await EasyPostRequest.executeRequest(config, method, url, apiVersion, parameters: parameters);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> requestJson(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    final response =
        await EasyPostRequest.executeRequest(config, method, url, apiVersion, parameters: parameters);

    dynamic json = jsonDecode(response.body);

    if (rootElement != null) {
      json = json[rootElement];
    }

    return json;
  }
}

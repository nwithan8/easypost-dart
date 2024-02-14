import 'dart:async';
import 'dart:convert';

import 'package:easypost/src/api/client_configuration.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/easypost_request.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/services/account_service.dart';
import 'package:easypost/src/api/services/address_service.dart';
import 'package:easypost/src/api/services/api_key_service.dart';
import 'package:easypost/src/api/services/batch_service.dart';
import 'package:easypost/src/api/services/billing_service.dart';
import 'package:easypost/src/api/services/carrier_account_service.dart';
import 'package:easypost/src/api/services/carrier_info_service.dart';
import 'package:easypost/src/api/services/carrier_type_service.dart';
import 'package:easypost/src/api/services/customs_info_service.dart';
import 'package:easypost/src/api/services/customs_item_service.dart';
import 'package:easypost/src/api/services/end_shipper_service.dart';
import 'package:easypost/src/api/services/event_service.dart';
import 'package:easypost/src/api/services/insurance_service.dart';
import 'package:easypost/src/api/services/order_service.dart';
import 'package:easypost/src/api/services/parcel_service.dart';
import 'package:easypost/src/api/services/partner_service.dart';
import 'package:easypost/src/api/services/pickup_service.dart';
import 'package:easypost/src/api/services/rate_service.dart';
import 'package:easypost/src/api/services/referral_customer_service.dart';
import 'package:easypost/src/api/services/refund_service.dart';
import 'package:easypost/src/api/services/report_service.dart';
import 'package:easypost/src/api/services/scan_form_service.dart';
import 'package:easypost/src/api/services/shipment_service.dart';
import 'package:easypost/src/api/services/tracker_service.dart';
import 'package:easypost/src/api/services/user_service.dart';
import 'package:easypost/src/api/services/webhook_service.dart';

///  The Main EasyPost Client
///
///  ```dart
///  ClientConfiguration config = ClientConfiguration("TEST_API_KEY", "PRODUCTION_API_KEY", ApiVersion.v2);
///  Client client = Client(config);
/// ```
class Client {
  /// HTTP Client
  final ClientConfiguration config;

  /// Creates a new [Client] instance.
  Client(this.config);

  /// Switches the client to production mode.
  void enableProductionMode() {
    config.enableProductionMode();
  }

  /// Switches the client to test mode.
  void enableTestMode() {
    config.enableTestMode();
  }

  /// Services for account-related methods of the EasyPost API.
  AccountService get accounts => AccountService(this);

  /// Service for address-related methods of the EasyPost API.
  AddressService get addresses => AddressService(this);

  /// Service for API key-related methods of the EasyPost API.
  ApiKeyService get apiKeys => ApiKeyService(this);

  /// Service for batch-related methods of the EasyPost API.
  BatchService get batches => BatchService(this);

  /// Service for billing-related methods of the EasyPost API.
  BillingService get billing => BillingService(this);

  /// Service for carrier account-related methods of the EasyPost API.
  CarrierAccountService get carrierAccounts => CarrierAccountService(this);

  /// Service for carrier info-related methods of the EasyPost API.
  CarrierInfoService get carrierMetadata => CarrierInfoService(this);

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
  InsuranceService get insurance => InsuranceService(this);

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
      await EasyPostRequest.executeRequest(config, method, url, apiVersion,
          parameters: parameters);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> requestJson(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    final response = await EasyPostRequest.executeRequest(
        config, method, url, apiVersion,
        parameters: parameters);

    dynamic json = jsonDecode(response.body);

    if (rootElement != null) {
      json = json[rootElement];
    }

    return json;
  }
}

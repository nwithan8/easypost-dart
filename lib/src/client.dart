import 'dart:async';
import 'dart:convert';

import 'package:easypost/src/client_configuration.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/services.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> _executeRequest(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) async {
    final request =
        _prepareRequest(method, url, apiVersion, parameters: parameters);

    final streamedResponse = await config.client?.send(request);

    if (streamedResponse == null) {
      throw Exception("No Response");
    }

    switch (streamedResponse.statusCode) {
      // TODO: Process status codes, parse Error JSON
      case 400:
        throw Exception('Bad Request');
      case 401:
        throw Exception('Unauthorized');
      case 403:
        throw Exception('Forbidden');
      case 404:
        throw Exception('Requested Resource was Not Found');
      case 422:
        throw Exception('Unprocessable Entity');
      case 500:
      case 502:
      case 504:
        throw Exception('Server Error');
    }

    return await http.Response.fromStream(streamedResponse);
  }

  Future<bool> request(HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    try {
      await _executeRequest(method, url, apiVersion, parameters: parameters);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<dynamic> requestJson(
      HttpMethod method, String url, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters, String? rootElement}) async {
    final response =
        await _executeRequest(method, url, apiVersion, parameters: parameters);

    dynamic json = jsonDecode(response.body);

    if (rootElement != null) {
      json = json[rootElement];
    }

    return json;
  }

  http.Request _prepareRequest(
      HttpMethod method, String endpoint, ApiVersion apiVersion,
      {Map<String, dynamic>? parameters}) {
    // Prepare the URL
    Uri uri = Uri.parse('${config.fullBaseUrl}/$endpoint');

    if (parameters != null &&
        (method == HttpMethod.get || method == HttpMethod.delete)) {
      // Add query parameters to a GET/DELETE request URL
      // Each value in the parameters needs to be a String
      uri = uri.replace(queryParameters: parameters.map((key, value) => MapEntry(key, value.toString())));
    }

    // Create the request
    final http.Request request = http.Request(method.value, uri);

    // Add the headers
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    request.headers['Authorization'] = 'Bearer ${config.apiKey}';

    // Add body to a POST/PUT/PATCH request
    if (parameters != null &&
        (method == HttpMethod.post ||
            method == HttpMethod.put ||
            method == HttpMethod.patch)) {
      request.body = jsonEncode(parameters);
    }

    return request;
  }
}

const String webhookSignatureHeader = 'X-Hmac-Signature';

class ModelPrefixes {
  static const String address = 'adr';
  static const String batch = 'batch';
  static const String carrierAccount = 'ca';
  static const String customsInfo = 'cstinfo';
  static const String customsItem = 'cstitem';
  static const String endShipper = 'es';
  static const String insurance = 'ins';
  static const String order = 'order';
  static const String parcel = 'prcl';
  static const String pickup = 'pickup';
  static const String rate = 'rate';
  static const String cashFlowReport = 'cfrep';
  static const String paymentLogReport = 'plrep';
  static const String refundReport = 'refrep';
  static const String shipmentReport = 'shprep';
  static const String shipmentInvoiceReport = 'shpinvrep';
  static const String trackerReport = 'trkrep';
  static const String refund = 'rfnd';
  static const String scanForm = 'sf';
  static const String shipment = 'shp';
  static const String tracker = 'trk';
  static const String user = 'user';
  static const String webhook = 'hook';
}

class ErrorMessages {
  static const String invalidApiKeyType = 'Invalid API key type.';
  static const String invalidParameter = 'Invalid parameter {0}.';
  static const String missingWebhookSignature =
      'Missing $webhookSignatureHeader header.';
  static const String jsonDeserializationError =
      'Error deserializing JSON to {0}.';
  static const String jsonSerializationError = 'Error serializing {0} to JSON.';
  static const String jsonNoData = 'No JSON data.';
  static const String missingProperty = '{0} is missing property {1}.';
  static const String missingRequiredParameter =
      'Missing required parameter {0}.';
  static const String noObjectFound = 'No {0} found.';
  static const String noPaymentMethodsSetUp =
      'No payment methods are set up. Please add a payment method and try again.';
  static const String paymentMethodNotSetUp = 'Payment method not set up.';
  static const String paymentMethodNotFound = 'Payment method not found.';
  static const String resourceNotFound = 'Resource not found.';
  static const String nullObjectComparison = 'Cannot compare null objects.';
  static const String unexpectedHttpStatusCode =
      'Unexpected HTTP status code: {0}.';
  static const String apiDidNotReturnErrorDetails =
      'API did not return error details.';
  static const String apiErrorDetailsParsingError = 'RESPONSE.PARSE_ERROR';
  static const String noMorePagesToRetrieve = 'No more pages to retrieve.';
  static const String apiRequestTimedOut = 'API request timed out.';
  static const String noMatchingRatesFound = 'No matching rates found.';

  static String format(String message, List<String> args) {
    for (int i = 0; i < args.length; i++) {
      message = message.replaceFirst('{$i}', args[i]);
    }
    return message;
  }
}

const String webhookSignatureHeader = 'X-Hmac-Signature';

class ErrorMessages {
  static const String invalidApiKeyType =
      'Invalid API key type.';
  static const String invalidParameter = 'Invalid parameter {0}.';
  static const String missingWebhookSignature = 'Missing $webhookSignatureHeader header.';
  static const String jsonDeserializationError =
      'Error deserializing JSON to {0}.';
  static const String jsonSerializationError = 'Error serializing {0} to JSON.';
  static const String jsonNoData = 'No JSON data.';
  static const String missingProperty = '{0} is missing property {1}.';
  static const String missingRequiredParameter = 'Missing required parameter {0}.';
  static const String noObjectFound = 'No {0} found.';
  static const String noPaymentMethodsSetUp = 'No payment methods are set up. Please add a payment method and try again.';
  static const String paymentMethodNotSetUp = 'Payment method not set up.';
  static const String paymentMethodNotFound = 'Payment method not found.';
  static const String resourceNotFound = 'Resource not found.';
  static const String nullObjectComparison = 'Cannot compare null objects.';
  static const String unexpectedHttpStatusCode = 'Unexpected HTTP status code: {0}.';
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

import 'dart:convert';

import 'package:easypost/src/api/http/streamed_response.dart';
import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/api/bad_request_exception.dart';
import 'package:easypost/src/exceptions/api/gateway_timeout_exception.dart';
import 'package:easypost/src/exceptions/api/internal_server_exception.dart';
import 'package:easypost/src/exceptions/api/invalid_request_exception.dart';
import 'package:easypost/src/exceptions/api/method_not_allowed_function.dart';
import 'package:easypost/src/exceptions/api/not_found_exception.dart';
import 'package:easypost/src/exceptions/api/payment_exception.dart';
import 'package:easypost/src/exceptions/api/rate_limit_exception.dart';
import 'package:easypost/src/exceptions/api/service_unavailable_exception.dart';
import 'package:easypost/src/exceptions/api/timeout_exception.dart';
import 'package:easypost/src/exceptions/api/unauthorized_exception.dart';
import 'package:easypost/src/exceptions/http_exception.dart';
import 'package:easypost/src/models/error.dart';
import 'package:http/http.dart' as http;

/// Superclass for all EasyPost API-related exceptions.
abstract class ApiException extends HttpException {
  final String? reason;

  final List<Error>? errors;

  const ApiException(super.message, super.statusCode, this.reason,
      {this.errors});

  /// Creates an instance of [ApiException] based on the [response].
  static Future<ApiException> fromStreamedResponse(
      http.StreamedResponse response) async {
    if (!response.isError) {
      throw HttpException("Response is not an error.", response.statusCode);
    }

    final statusCode = response.statusCode;

    String? errorMessage;
    String? errorType;
    List<Error>? errors;

    try {
      // try to extract error details from the API response
      final body = await response.stream.bytesToString();
      final json = jsonDecode(body);

      dynamic msg = json['error']['message'];
      if (msg is List) {
        // Errors may be an array improperly assigned to the `message` field instead of the `errors` field, concatenate those here
        msg = msg.join(', ');
      }
      errorMessage = msg;

      errorType = json['error']['code'];
      errors = (json['error']['errors'] as List)
          .map((e) => Error.fromJson(e))
          .toList();
    } catch (e) {
      // could not extract error details from the API response (or API did not return data, i.e. 1xx, 3xx or 5xx)
      errorMessage =
          response.reasonPhrase // fallback to standard HTTP error message
              ??
              ErrorMessages
                  .apiDidNotReturnErrorDetails; // fallback to no error details
      errorType = ErrorMessages.apiErrorDetailsParsingError;
      errors = null;
    }

    // Return the appropriate exception based on the HTTP status code
    switch (statusCode) {
      case 400:
        return BadRequestException(errorMessage, statusCode, errorType,
            errors: errors);
      case 401:
        return ApiUnauthorizedException(errorMessage, statusCode, errorType,
            errors: errors);
      case 402:
        return ApiPaymentException(errorMessage, statusCode, errorType,
            errors: errors);
      case 403:
        return ApiUnauthorizedException(errorMessage, statusCode, errorType,
            errors: errors);
      case 404:
        return ApiNotFoundException(errorMessage, statusCode, errorType,
            errors: errors);
      case 405:
        return ApiMethodNotAllowedException(errorMessage, statusCode, errorType,
            errors: errors);
      case 408:
        return ApiTimeoutException(errorMessage, statusCode, errorType,
            errors: errors);
      case 422:
        return ApiInvalidRequestException(errorMessage, statusCode, errorType,
            errors: errors);
      case 429:
        return ApiRateLimitException(errorMessage, statusCode, errorType,
            errors: errors);
      case 500:
        return ApiInternalServerException(errorMessage, statusCode, errorType,
            errors: errors);
      case 503:
        return ApiServiceUnavailableException(
            errorMessage, statusCode, errorType,
            errors: errors);
      case 504:
        return ApiGatewayTimeoutException(errorMessage, statusCode, errorType,
            errors: errors);
    }

    // A unaccounted-for status code was in the response.
    String message = ErrorMessages.format(
        ErrorMessages.unexpectedHttpStatusCode, [statusCode.toString()]);
    throw HttpException(message, statusCode);
  }
}

import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/json/json_exception.dart';

/// An exception that is thrown when a JSON serialization error occurs.
class JsonSerializationException extends JsonException {
  const JsonSerializationException(super.message);

  static JsonSerializationException generate(String? message, [Type? toType]) {
    return JsonSerializationException(message ??
        ErrorMessages.format(
            ErrorMessages.jsonSerializationError, [toType.toString()]));
  }
}

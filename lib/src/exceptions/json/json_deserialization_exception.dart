import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/json/json_exception.dart';

/// An exception that is thrown when a JSON deserialization error occurs.
class JsonDeserializationException extends JsonException {
  const JsonDeserializationException(super.message);

  static JsonDeserializationException generate(String? message,
      [Type? toType]) {
    return JsonDeserializationException(message ??
        ErrorMessages.format(
            ErrorMessages.jsonDeserializationError, [toType.toString()]));
  }
}

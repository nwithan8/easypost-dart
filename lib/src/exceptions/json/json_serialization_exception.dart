import 'package:easypost/src/exceptions/json/json_exception.dart';

/// An exception that is thrown when a JSON serialization error occurs.
class JsonSerializationException extends JsonException {
  const JsonSerializationException(super.message);
}

import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/json/json_exception.dart';

/// An exception that is thrown when there is no data in a JSON response.
class JsonNoDataException extends JsonException {
  const JsonNoDataException(super.message);
}

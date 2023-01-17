import '../../base/exception.dart';

/// Superclass for all JSON-related exceptions.
abstract class JsonException extends EasyPostException {
  const JsonException(super.message);
}

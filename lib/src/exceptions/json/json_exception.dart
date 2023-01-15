import '../../base/exception.dart';

abstract class JsonException extends EasyPostException {
  const JsonException(super.message);
}

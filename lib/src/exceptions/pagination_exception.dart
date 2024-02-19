import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when a pagination error occurs.
class PaginationException extends EasyPostException {
  const PaginationException(super.message);
}

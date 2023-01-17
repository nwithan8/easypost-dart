import '../base/exception.dart';

/// An exception that is thrown when filtering a list fails.
class FilteringException extends EasyPostException {
  const FilteringException(super.message);
}

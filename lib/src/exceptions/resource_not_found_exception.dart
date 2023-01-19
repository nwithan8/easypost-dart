import 'package:easypost/src/base/exception.dart';

/// An exception that is thrown when a server-side resource is not found.
class ResourceNotFoundException extends EasyPostException {
  const ResourceNotFoundException(super.message);
}

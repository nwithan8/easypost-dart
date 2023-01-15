import '../base/exception.dart';

/// Superclass for all HTTP-related exceptions.
class HttpException extends EasyPostException {

  final int? statusCode;

  const HttpException(super.message, this.statusCode);
}

/// Superclass for all EasyPost client library-related exceptions.
abstract class EasyPostException implements Exception {
  final String? message;

  const EasyPostException(this.message);
}

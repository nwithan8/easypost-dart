/// The available HTTP methods.
enum HttpMethod { get, post, put, patch, delete }

extension HttpMethodExtension on HttpMethod {
  /// The HTTP method as a string.
  String get value {
    switch (this) {
      case HttpMethod.get:
        return 'GET';
      case HttpMethod.post:
        return 'POST';
      case HttpMethod.put:
        return 'PUT';
      case HttpMethod.patch:
        return 'PATCH';
      case HttpMethod.delete:
        return 'DELETE';
    }
  }

  /// The HTTP method as a string.
  String asString() => value;

  /// Converts a string to an [HttpMethod].
  static HttpMethod fromString(String method) {
    method = method.toUpperCase();
    switch (method) {
      case 'GET':
        return HttpMethod.get;
      case 'POST':
        return HttpMethod.post;
      case 'PUT':
        return HttpMethod.put;
      case 'PATCH':
        return HttpMethod.patch;
      case 'DELETE':
        return HttpMethod.delete;
      default:
        throw ArgumentError('Invalid HTTP method: $method');
    }
  }
}

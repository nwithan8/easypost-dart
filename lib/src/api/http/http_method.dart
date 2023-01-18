/// The available HTTP methods.
enum HttpMethod {
  get,
  post,
  put,
  patch,
  delete
}

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
}

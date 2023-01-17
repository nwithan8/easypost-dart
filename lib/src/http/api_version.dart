/// The available API versions.
enum ApiVersion {
  /// The beta API version.
  beta,
  /// The v2 API version.
  v2,
}

extension ApiVersionExtension on ApiVersion {
  /// The API version as a string.
  String get value {
    switch (this) {
      case ApiVersion.beta:
        return 'beta';
      case ApiVersion.v2:
        return 'v2';
    }
  }

  /// The API version as a string.
  String asString() => value;
}

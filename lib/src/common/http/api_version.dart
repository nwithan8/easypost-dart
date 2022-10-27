enum ApiVersion {
  beta,
  v2,
}

extension ApiVersionExtension on ApiVersion {
  String get value {
    switch (this) {
      case ApiVersion.beta:
        return 'beta';
      case ApiVersion.v2:
        return 'v2';
    }
  }

  String asString() => value;
}

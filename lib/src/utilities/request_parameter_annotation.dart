

enum Necessity {
  required,
  optional,
}

class RequestParameter {
  final List<String> jsonPath;

  final Necessity necessity;

  const RequestParameter(this.necessity, this.jsonPath);
}

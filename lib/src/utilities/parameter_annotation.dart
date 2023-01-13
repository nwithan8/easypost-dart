

enum Necessity {
  required,
  optional,
}

/// An annotation for a function parameter.
class Parameter {
  final Necessity necessity;

  const Parameter(this.necessity);
}

/// An annotation for a JSON request parameter.
class JsonParameter extends Parameter {
  final List<String> jsonPath;

  const JsonParameter(Necessity necessity, this.jsonPath) : super(necessity);
}

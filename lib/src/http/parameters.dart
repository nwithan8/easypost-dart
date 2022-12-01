extension ParameterExtension on Map<String, dynamic> {
  Map<String, dynamic> wrap(List<String> keys) {
    Map<String, dynamic> wrapped = this;
    for (final key in keys) {
      wrapped = {key: wrapped};
    }
    return wrapped;
  }
}

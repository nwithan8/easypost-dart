/// A Java-like enum implementation for Dart.
/// An enum that has an internal ID.
class Enum {
  final int _id;

  const Enum(this._id);

  @override
  String toString() => _id.toString();

  @override
  bool operator ==(Object other) => other is Enum && other._id == _id;

  @override
  int get hashCode => _id.hashCode;
}

/// A Java-like enum implementation for Dart.
/// An enum that has an internal ID and a value.
class ValueEnum extends Enum {
  final dynamic value;

  const ValueEnum(id, this.value) : super(id);

  @override
  String toString() => value.toString();

  bool matches(ValueEnum other) => value == other.value;
}

/// A Java-like enum implementation for Dart.
/// An enum that has an internal ID and a list of values.
class MultiValueEnum extends Enum {
  final List<dynamic> values;

  const MultiValueEnum(id, this.values) : super(id);

  @override
  String toString() => values.join(',');
}

/// A Java-like enum implementation for Dart.
/// An enum that has a corresponding JSON value for de/serialization.
class SerializableEnum extends ValueEnum {
  const SerializableEnum(id, jsonValue) : super(id, jsonValue);
}

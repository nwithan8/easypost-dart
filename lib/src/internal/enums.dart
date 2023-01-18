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

class ValueEnum extends Enum {
  final dynamic value;

  const ValueEnum(id, this.value) : super(id);

  @override
  String toString() => value.toString();
}

class MultiValueEnum extends Enum {
  final List<dynamic> values;

  const MultiValueEnum(id, this.values) : super(id);

  @override
  String toString() => values.join(',');
}

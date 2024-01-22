import 'package:reflectable/mirrors.dart';

import 'custom_annotation.dart';

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

  /// A [Function] to use when encoding the parameter to JSON.
  ///
  /// Must be a top-level or static [Function] or a constructor that accepts one
  /// positional argument compatible with the field being serialized that
  /// returns a JSON-compatible value.
  final Function? toJson;

  const JsonParameter(Necessity necessity, this.jsonPath, {this.toJson}) : super(necessity);

  static JsonParameter? getJsonParameter(DeclarationMirror mirror) {
    return CustomAnnotation.getAnnotationOfType<JsonParameter>(
        JsonParameter, mirror);
  }
}

class SubJsonParameter extends JsonParameter {
  final Type parentType;

  const SubJsonParameter(this.parentType, Necessity necessity, List<String> jsonPath, {Function? toJson}) : super(necessity, jsonPath, toJson: toJson);

  static SubJsonParameter? getSubJsonParameter(Type? parentType, DeclarationMirror mirror) {
    if (parentType == null) {
      return null;
    }

    List<SubJsonParameter>? subJsonParameters = CustomAnnotation.getAnnotationsOfType<SubJsonParameter>(
        SubJsonParameter, mirror);
    if (subJsonParameters == null) {
      return null;
    }

    for (SubJsonParameter subJsonParameter in subJsonParameters) {
      if (subJsonParameter.parentType == parentType) {
        return subJsonParameter;
      }
    }

    return null;
  }
}

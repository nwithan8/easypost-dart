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

  const JsonParameter(Necessity necessity, this.jsonPath) : super(necessity);

  static JsonParameter? getJsonParameter(DeclarationMirror mirror) {
    return CustomAnnotation.getAnnotationOfType<JsonParameter>(
        JsonParameter, mirror);
  }
}

class SubJsonParameter extends JsonParameter {
  final Type parentType;

  const SubJsonParameter(this.parentType, Necessity necessity, List<String> jsonPath) : super(necessity, jsonPath);

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

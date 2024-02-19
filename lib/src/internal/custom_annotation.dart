// import 'dart:mirrors';
import 'package:reflectable/reflectable.dart';

class CustomAnnotation {
  static T? getAnnotationOfType<T>(Type type, DeclarationMirror mirror) {
    if (mirror.metadata.isEmpty) {
      return null;
    }

    for (var metadata in mirror.metadata) {
      if (metadata.runtimeType == type) {
        return metadata as T;
      }
    }

    return null;
  }

  static List<T>? getAnnotationsOfType<T>(Type type, DeclarationMirror mirror) {
    if (mirror.metadata.isEmpty) {
      return null;
    }

    List<T> annotations = [];
    for (var metadata in mirror.metadata) {
      if (metadata.runtimeType == type) {
        annotations.add(metadata as T);
      }
    }

    return annotations;
  }
}

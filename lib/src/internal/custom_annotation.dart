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
}

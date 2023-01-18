import 'dart:mirrors';

class CustomAnnotation {
  static T? getAnnotationOfType<T>(Type type, DeclarationMirror mirror) {
    if (mirror.metadata.isEmpty) {
      return null;
    }

    for (var metadata in mirror.metadata) {
      if (metadata.reflectee.runtimeType == type) {
        return metadata.reflectee as T;
      }
    }

    return null;
  }
}

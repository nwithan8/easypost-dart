import 'package:reflectable/reflectable.dart';
import 'package:easypost/src/internal/reflection.dart';

import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/internal/enums.dart';
import 'package:easypost/src/exceptions/parameters/missing_parameter_exception.dart';
import 'package:easypost/src/internal/custom_annotation.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:tuple/tuple.dart';

@reflector
class Parameters {
  final Map<String, dynamic> _parameterMap = {};

  Parameters();

  /// Validate all [Parameter]s to ensure that all required parameters are set
  /// Use this method to validate parameters during a function call
  void validate() {
    // Collect all properties for this class
    var propertiesAndMirror = _allPropertiesAndMirror(this);
    var properties = propertiesAndMirror.item1;
    var mirror = propertiesAndMirror.item2;

    // Check that all required parameters are set
    for (var property in properties) {
      // Get the parameter attribute for this property
      var parameterAttribute =
      CustomAnnotation.getAnnotationOfType<Parameter>(Parameter, property);
      // If the property is not a parameter, ignore it
      if (parameterAttribute == null) {
        continue;
      }

      // If the parameter is required and not set, throw an exception
      if (parameterAttribute.necessity == Necessity.required) {
        try {
          var value = mirror.invokeGetter(property.simpleName);
          if (value == null) {
            throw MissingParameterException(
                "Required parameter '${property.simpleName}' is not set");
          }
        } catch (e) {
          // If the property is not set, ignore it
          continue;
        }
      }
    }
  }

  /// Convert all [JsonParameter]s to a [Map].
  /// Use specifically when sending a JSON request to the API.
  Map<String, dynamic> constructJson({Client? client}) {
    // Verify that all required parameters are set in the dictionary
    validate();

    // Collect all properties for this class
    var propertiesAndMirror = _allPropertiesAndMirror(this);
    var properties = propertiesAndMirror.item1;
    var mirror = propertiesAndMirror.item2;

    // Initialize parameter map, using the override parameters if they exist
    Map<String, dynamic> parameterMap = _parameterMap;

    // Iterate over all properties
    for (var property in properties) {
      var parameterAttribute =
          CustomAnnotation.getAnnotationOfType<JsonParameter>(
              JsonParameter, property);
      if (parameterAttribute == null) {
        // Ignore any properties that are not annotated with a JsonParameter attribute
        continue;
      }

      // get the value of the property
      try {
        var value = mirror.invokeGetter(property.simpleName);
        if (value == null &&
            parameterAttribute.necessity == Necessity.optional) {
          // Ignore any optional parameters that are null
          continue;
        }
        if (value is Parameters) {
          // If the value is a RequestParameters object, recursively add its parameters
          value = value.constructJson();
        } else if (value is SerializableEnum) {
          // If the value is a SerializableEnum, convert it to a string
          value = value.toString();
        } else if (value is List<Parameters>) {
          List<Map<String, dynamic>> valueList = [];
          for (var item in value) {
            valueList.add(item.constructJson());
          }
          value = valueList;
        }
        parameterMap =
            _updateMap(parameterMap, parameterAttribute.jsonPath, value);
      } catch (e) {
        // If the property is not set, ignore it
        continue;
      }
    }

    // Return the dictionary, removing any null values now that we've verified all required parameters are set
    // Anything still null at this point is an optional parameter that was not set that can be stripped from the request

    return parameterMap;
  }

  /// Get all properties for this class
  Tuple2<Iterable<DeclarationMirror>, InstanceMirror> _allPropertiesAndMirror(Object reflectee) {
    // Construct the dictionary of all parameters
    InstanceMirror im = reflector.reflect(reflectee);
    ClassMirror classMirror = im.type;

    // Collect all properties for this class
    var properties = classMirror.declarations.values;

    // Collect all properties for all superclasses
    if (classMirror.qualifiedName != '.Parameters') {
      var superclass = classMirror.superclass;
      while (superclass != null && superclass.qualifiedName != '.Parameters') {
        properties = properties.followedBy(superclass.declarations.values);
        superclass = superclass.superclass;
      }
    }

    return Tuple2(properties, im);
  }

  /// Create a [Parameters] object from a [Map].
  static Parameters fromMap(Map<String, dynamic> map) {
    return Parameters(); // Base, override in subclasses
  }

  /// Update a [Map] with a value at a given path.
  static Map<String, dynamic> _updateMap(
      Map<String, dynamic>? map, List<String> keys, dynamic value) {
    map ??= {};

    List keysCopy = keys.toList();

    if (keysCopy.isEmpty) {
      // Don't need to go down
      return map;
    }

    if (keysCopy.length == 1) {
      // Last key left
      var soloKey = keysCopy[0];
      if (map.containsKey(soloKey)) {
        // Key-value pair already exists in dictionary (likely because of override parameters)
        // Only change the value if the existing value is null
        if (map[soloKey] == null) {
          map[soloKey] = value;
        }
      } else {
        // Key does not exist, so we can just add it
        map[soloKey] = value;
      }
      return map;
    }

    // Need to go down another level
    // Get the key and update the list of keys
    var key = keysCopy[0];
    keysCopy.removeAt(0);
    if (!map.containsKey(key)) {
      map[key] =
          _updateMap(<String, dynamic>{}, keysCopy as List<String>, value);
    }

    var subMap = map[key];
    if (subMap is Map<String, dynamic>) {
      map[key] = _updateMap(subMap, keysCopy as List<String>, value);
    } else {
      throw Exception('Found a non-map while traversing the map');
    }

    return map;
  }
}

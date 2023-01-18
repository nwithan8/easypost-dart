import 'dart:mirrors';

import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/internal/custom_annotation.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

import '../../../easypost.dart';

class Parameters {
  late Map<String, dynamic> _parameterMap;

  Parameters({Map<String, dynamic>? overrideParameters}) {
    _parameterMap = overrideParameters ?? {};
  }

  /// Validate all [Parameter]s to ensure that all required parameters are set
  /// Use this method to validate parameters during a function call
  void validate() {
    InstanceMirror im = reflect(this);
    ClassMirror classMirror = im.type;

    // Check that all required parameters are set
    for (var property in classMirror.declarations.values) {
      // Get the parameter attribute for this property
      var parameterAttribute =
      CustomAnnotation.getAnnotationOfType<Parameter>(
          Parameter, property);
      // If the property is not a parameter, ignore it
      if (parameterAttribute == null) {
        continue;
      }

      // TODO: Handle overridden parameters during validation

      // If the parameter is required and not set, throw an exception
      if (parameterAttribute.necessity == Necessity.required) {
        try {
          var value = im.getField(property.simpleName).reflectee;
          if (value == null) {
            throw Exception(
                "Required parameter '${MirrorSystem.getName(property.simpleName)}' is not set");
          }
        } catch (e) {
          // If the property is not set, ignore it
          continue;
        }
      }

      // TODO: Verify all or nothing optional parameter groups
    }
  }

  /// Convert all [JsonParameter]s to a [Map].
  /// Use specifically when sending a JSON request to the API.
  Map<String, dynamic> constructJson({Client? client, ApiVersion? apiVersion}) {
    apiVersion = apiVersion ?? client!.config.apiVersion;

    // Verify that all required parameters are set in the dictionary
    validate();

    // Construct the dictionary of all parameters for this API version
    InstanceMirror im = reflect(this);
    ClassMirror classMirror = im.type;

    // Collect all properties for this class
    var properties = classMirror.declarations.values;

    // Collect all properties for all superclasses
    var superclass = classMirror.superclass;
    while (superclass != null) {
      properties = properties.followedBy(superclass.declarations.values);
      superclass = superclass.superclass;
    }

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

      // Check if the parameter is compatible with the API version, if provided
      // TODO: Implement API Version Compatibility

      // get the value of the property
      try {
        var value = im.getField(property.simpleName).reflectee;
        if (value == null && parameterAttribute.necessity == Necessity.optional) {
          // Ignore any optional parameters that are null
          continue;
        }
        if (value is Parameters) {
          // If the value is a RequestParameters object, recursively add its parameters
          value = value.constructJson(apiVersion: apiVersion);
        } else if (value is List<Parameters>) {
          List<Map<String, dynamic>> valueList = [];
          for (var item in value) {
            valueList.add(item.constructJson(apiVersion: apiVersion));
          }
          value = valueList;
        }
        parameterMap = _updateMap(parameterMap, parameterAttribute.jsonPath, value);
      } catch (e) {
        // If the property is not set, ignore it
        continue;
      }
    }

    // Return the dictionary, removing any null values now that we've verified all required parameters are set
    // Anything still null at this point is an optional parameter that was not set that can be stripped from the request

    return parameterMap;
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
      map[key] = _updateMap(<String, dynamic>{}, keysCopy as List<String>, value);
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

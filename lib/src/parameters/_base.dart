import 'dart:mirrors';

import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/utilities/custom_annotation.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../../easypost.dart';

class RequestParameters {
  late Map<String, dynamic> _parameterMap;

  RequestParameters({Map<String, dynamic>? overrideParameters}) {
    _parameterMap = overrideParameters ?? {};
  }

  Map<String, dynamic> toMap({Client? client, ApiVersion? apiVersion}) {
    apiVersion = apiVersion ?? client!.config.apiVersion;

    // Construct the dictionary of all parameters for this API version
    _registerParameters(apiVersion);

    // Verify that all required parameters are set in the dictionary
    _validateParameters();

    // Return the dictionary, removing any null values now that we've verified all required parameters are set
    // Anything still null at this point is an optional parameter that was not set that can be stripped from the request

    return _parameterMap;
  }

  void _validateParameters() {
    InstanceMirror im = reflect(this);
    ClassMirror classMirror = im.type;

    // Check that all required parameters are set
    for (var property in classMirror.declarations.values) {
      // Get the parameter attribute for this property
      var parameterAttribute =
          CustomAnnotation.getAnnotationOfType<RequestParameter>(
              RequestParameter, property);
      // If the property is not a parameter, ignore it
      if (parameterAttribute == null) {
        continue;
      }

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

  void _add(RequestParameter annotation, dynamic value) {
    _parameterMap = _updateMap(_parameterMap, annotation.jsonPath, value);
  }

  void _registerParameters(ApiVersion apiVersion) {
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

    // Iterate over all properties
    for (var property in properties) {
      var parameterAttribute =
          CustomAnnotation.getAnnotationOfType<RequestParameter>(
              RequestParameter, property);
      if (parameterAttribute == null) {
        // Ignore any properties that are not annotated with a parameter attribute
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
        if (value is RequestParameters) {
          // If the value is a RequestParameters object, recursively add its parameters
          value = value.toMap(apiVersion: apiVersion);
        } else if (value is List<RequestParameters>) {
          List<Map<String, dynamic>> valueList = [];
          for (var item in value) {
            valueList.add(item.toMap(apiVersion: apiVersion));
          }
          value = valueList;
        }
        _add(parameterAttribute, value);
      } catch (e) {
        // If the property is not set, ignore it
        continue;
      }
    }
  }

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

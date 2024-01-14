String? getOrDefaultString(Map<String, dynamic> map, String key,
    {String? defaultValue}) {
  if (map.containsKey(key)) {
    return map[key];
  } else {
    return defaultValue;
  }
}

bool? getOrDefaultBool(Map<String, dynamic> map, String key,
    {bool? defaultValue}) {
  if (map.containsKey(key)) {
    return map[key];
  } else {
    return defaultValue;
  }
}

int? getOrDefaultInt(Map<String, dynamic> map, String key,
    {int? defaultValue}) {
  if (map.containsKey(key)) {
    return map[key] is double ? (map[key] as double).toInt() : map[key];
  } else {
    return defaultValue;
  }
}

double? getOrDefaultDouble(Map<String, dynamic> map, String key,
    {double? defaultValue}) {
  if (map.containsKey(key)) {
    return map[key] is int ? (map[key] as int).toDouble() : map[key];
  } else {
    return defaultValue;
  }
}

DateTime? getOrDefaultDateTime(Map<String, dynamic> map, String key,
    {DateTime? defaultValue}) {
  if (map.containsKey(key)) {
    return DateTime.parse(map[key]);
  } else {
    return defaultValue;
  }
}

List<String>? getOrDefaultStringList(Map<String, dynamic> map, String key,
    {List<String>? defaultValue}) {
  if (map.containsKey(key)) {
    return List<String>.from(map[key]);
  } else {
    return defaultValue;
  }
}

List<int>? getOrDefaultIntList(Map<String, dynamic> map, String key,
    {List<int>? defaultValue}) {
  if (map.containsKey(key)) {
    return List<int>.from(map[key] is List<double>
        ? (map[key] as List<double>).map((e) => e.toInt())
        : map[key]);
  } else {
    return defaultValue;
  }
}

List<double>? getOrDefaultDoubleList(Map<String, dynamic> map, String key,
    {List<double>? defaultValue}) {
  if (map.containsKey(key)) {
    return List<double>.from(map[key] is List<int>
        ? (map[key] as List<int>).map((e) => e.toDouble())
        : map[key]);
  } else {
    return defaultValue;
  }
}

List<DateTime>? getOrDefaultDateTimeList(Map<String, dynamic> map, String key,
    {List<DateTime>? defaultValue}) {
  if (map.containsKey(key)) {
    return List<DateTime>.from(map[key].map((e) => DateTime.parse(e)));
  } else {
    return defaultValue;
  }
}

Map<String, dynamic>? getOrDefaultMap(Map<String, dynamic> map, String key,
    {Map<String, dynamic>? defaultValue}) {
  if (map.containsKey(key)) {
    return map[key];
  } else {
    return defaultValue;
  }
}

List<Map<String, dynamic>>? getOrDefaultMapList(
    Map<String, dynamic> map, String key,
    {List<Map<String, dynamic>>? defaultValue}) {
  if (map.containsKey(key)) {
    return List<Map<String, dynamic>>.from(map[key]);
  } else {
    return defaultValue;
  }
}

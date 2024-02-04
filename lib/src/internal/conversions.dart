import 'dart:convert';

import 'package:easypost/src/base/model_with_id.dart';
import 'package:easypost/src/internal/crypto.dart';
import 'package:intl/intl.dart';

DateTime? stringToDateTime(String? timestamp) =>
    timestamp == null ? null : DateTime.parse(timestamp).toUtc();

// FIXME: If timezone issues arise, check here
String? dateTimeToString(DateTime? time) => time == null
    ? null
    : '${DateFormat('yyyy-MM-ddTHH:mm:ss').format(time.toUtc())}Z';

/// Converts a string (20.00) to an int of cents (2000)
int? stringToCents(String? money) =>
    money == null ? null : (stringToMoney(money) * 100).toInt();

/// Converts an int of cents (2000) to a string (2000)
String? centsToString(int? cents) => cents?.toString();

/// Converts a double (20.00) to an int of cents (2000)
int? moneyToCents(double? money) =>
    money == null ? null : (money * 100).toInt();

/// Converts an int of cents (2000) to a double (20.00)
double? centsToMoney(int? cents) => cents == null ? null : cents / 100;

/// Converts a double (20.00) to a string (20.00)
String? moneyToString(double? money) => money?.toString();

/// Converts a string (20.00) to a double (20.00)
double stringToMoney(String? money) =>
    money == null ? 0.0 : double.parse(money);

/// Converts a double (20.00) to a string of cents (2000)
String? moneyToStringCents(double? money) =>
    money == null ? null : moneyToCents(money).toString();

/// Converts a string of cents (2000) to a double (20.00)
double stringCentsToMoney(String? money) =>
    money == null ? 0.0 : int.parse(money) / 100;

// FIXME: If dependency circle issues arise, check this import
String? modelToId(ModelWithId? model) => model?.id;

/// Converts a list of models to a list of ids
List<String?>? modelsToIds(List<ModelWithId>? models) {
  if (models == null) {
    return null;
  }
  List<String?> ids = [];
  for (ModelWithId model in models) {
    ids.add(model.id);
  }
  return ids;
}

/// Convert a byte array to a hex string.
String bytesToHex(List<int> bytes) {
  return bytes.map((e) => e.toRadixString(16)).join();
}

/// Convert a hex string to a byte array.
List<int> hexToBytes(String hex) {
  return hex.split('').map((e) => int.parse(e, radix: 16)).toList();
}

/// Convert a string to a hex string.
String stringToHex(String data) {
  var dataBytes = encodeUtf8(data);
  return bytesToHex(dataBytes);
}

/// Convert a hex string to a string.
String hexToString(String hex) {
  var dataBytes = hexToBytes(hex);
  return decodeUtf8(dataBytes);
}

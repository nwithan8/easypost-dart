import 'dart:convert';

import 'package:easypost/src/base/readonly_model_with_id.dart';
import 'package:easypost/src/internal/crypto.dart';
import 'package:intl/intl.dart';

DateTime? stringToDateTime(String? timestamp) =>
    timestamp == null ? null : DateTime.parse(timestamp).toUtc();

// FIXME: If timezone issues arise, check here
String? dateTimeToString(DateTime? time) => time == null
    ? null
    : '${DateFormat('yyyy-MM-ddTHH:mm:ss').format(time.toUtc())}Z';

String? dateTimeToStringDDMMYYYY(DateTime? time) =>
    time == null ? null : DateFormat("dd/MM/yyyy").format(time);

String? dateTimeToStringYYYYMMDD(DateTime? time) =>
    time == null ? null : DateFormat("yyyy-MM-dd").format(time);

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

/// Converts a dynamic to a double
double? anyToMoney(dynamic money) {
  if (money == null) {
    return null;
  } else if (money is String) {
    return stringToMoney(money);
  } else if (money is int) {
    return money.toDouble();
  } else if (money is double) {
    return money;
  } else {
    throw ArgumentError('Invalid money type');
  }
}

/// Converts a double (20.00) to a string of cents (2000)
String? moneyToStringCents(double? money) =>
    money == null ? null : moneyToCents(money).toString();

/// Converts a string of cents (2000) to a double (20.00)
double stringCentsToMoney(String? money) =>
    money == null ? 0.0 : int.parse(money) / 100;

/// Converts a string to a double
double stringToDouble(String? value) => value == null ? 0.0 : double.parse(value);

/// Converts a double to a string
String? doubleToString(double? value) => value?.toString();

// FIXME: If dependency circle issues arise, check this import
String? modelToId(ReadOnlyModelWithId? model) => model?.id;

/// Converts a list of models to a list of ids
List<String?>? modelsToIds(List<ReadOnlyModelWithId>? models) {
  if (models == null) {
    return null;
  }
  List<String?> ids = [];
  for (ReadOnlyModelWithId model in models) {
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

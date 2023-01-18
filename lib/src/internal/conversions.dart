import 'package:easypost/src/base/model.dart';

DateTime? stringToDateTime(String? timestamp) =>
    timestamp == null ? null : DateTime.parse(timestamp).toUtc();

String? dateTimeToString(DateTime? time) => time?.toUtc().toIso8601String();

double stringToMoney(String? money) =>
    money == null ? 0.0 : double.parse(money);

String? moneyToString(double? money) => money?.toString();

String? modelToId(Model? model) => model?.id;

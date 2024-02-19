import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/order_rate.dart';

@reflector
class BuyOrder extends Parameters {
  @JsonParameter(Necessity.required, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['service'])
  String? service;

  BuyOrder() : super();

  static BuyOrder fromOrderRate(OrderRate rate) => BuyOrder()
    ..carrier = rate.carrier
    ..service = rate.service;
}

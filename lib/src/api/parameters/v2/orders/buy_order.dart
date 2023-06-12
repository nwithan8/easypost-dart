import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class BuyOrder extends Parameters {
  @JsonParameter(Necessity.required, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.required, ['service'])
  String? service;

  BuyOrder()
      : super();
}
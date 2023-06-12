import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class CreateParcel extends Parameters {
  @JsonParameter(Necessity.optional, ['parcel', 'height'])
  double? height;

  @JsonParameter(Necessity.optional, ['parcel', 'length'])
  double? length;

  @JsonParameter(Necessity.optional, ['parcel', 'width'])
  double? width;

  @JsonParameter(Necessity.optional, ['parcel', 'weight'])
  double? weight;

  CreateParcel()
      : super();
}
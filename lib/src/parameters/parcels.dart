import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

class ParcelsCreate extends Create {
  @RequestParameter(Necessity.optional, ['parcel', 'height'])
  double? height;

  @RequestParameter(Necessity.optional, ['parcel', 'length'])
  double? length;

  @RequestParameter(Necessity.optional, ['parcel', 'width'])
  double? width;

  @RequestParameter(Necessity.optional, ['parcel', 'weight'])
  double? weight;

  ParcelsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ParcelsAll extends All {
  ParcelsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

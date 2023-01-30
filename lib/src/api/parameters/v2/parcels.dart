import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';

class ParcelsCreate extends Create {
  @JsonParameter(Necessity.optional, ['parcel', 'height'])
  double? height;

  @JsonParameter(Necessity.optional, ['parcel', 'length'])
  double? length;

  @JsonParameter(Necessity.optional, ['parcel', 'width'])
  double? width;

  @JsonParameter(Necessity.optional, ['parcel', 'weight'])
  double? weight;

  ParcelsCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class ParcelsAll extends All {
  ParcelsAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

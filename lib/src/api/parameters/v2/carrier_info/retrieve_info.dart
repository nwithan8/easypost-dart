import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/enums/carrier_info_type.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/internal/reflection.dart';

@reflector
class RetrieveInfo extends Parameters {
  @JsonParameter(Necessity.optional, ['carriers'])
  List<String>? carriers;

  @JsonParameter(Necessity.optional, ['types'])
  List<CarrierInfoType>? types;

  RetrieveInfo() : super();

  @override
  Map<String, dynamic> constructJson({Client? client}) {
    Map<String, dynamic> carrierInfoMap = <String, dynamic>{};

    if (carriers != null) {
      carrierInfoMap['carriers'] = carriers!.join(',');
    }

    if (types != null) {
      List<String> typeStrings = <String>[];
      for (CarrierInfoType infoType in types!) {
        typeStrings.add(infoType.toString());
      }
      carrierInfoMap['types'] = typeStrings.join(',');
    }

    return carrierInfoMap;
  }
}

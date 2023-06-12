import 'package:easypost/src/api/parameters/v2/addresses.dart';
import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';

@reflector
class EndShippersCreate extends AddressesCreate {
  EndShippersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class EndShippersUpdate extends AddressesUpdate {
  EndShippersUpdate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class EndShippersAll extends AddressesAll {
  EndShippersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

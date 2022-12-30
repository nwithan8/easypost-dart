import 'package:easypost/src/parameters/_generic.dart';
import 'package:easypost/src/utilities/request_parameter_annotation.dart';

import '../../easypost.dart';
import '../models.dart';

class TrackersCreate extends Create {
  @RequestParameter(Necessity.optional, ['tracker', 'amount'])
  String? amount;

  @RequestParameter(Necessity.optional, ['tracker', 'carrier'])
  String? carrier;

  @RequestParameter(Necessity.optional, ['options', 'carrier_account'])
  String? carrierAccount;

  @RequestParameter(Necessity.optional, ['options', 'full_test_tracker'])
  bool? fullTestTracker;

  @RequestParameter(Necessity.optional, ['options', 'is_return'])
  bool? isReturn;

  @RequestParameter(Necessity.optional, ['tracker', 'tracking_code'])
  String? trackingCode;

  TrackersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

class TrackersCreateList extends Create {
  @RequestParameter(Necessity.optional, ['trackers'])
  List<Tracker>? trackers;

  TrackersCreateList({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);

  // TODO: This custom overload does not check for API compatibility.
  // TODO: Please, fix this hack in the API?
  @override
  Map<String, dynamic> toMap(Client client) {
    Map<String, dynamic> trackersMap = <String, dynamic>{};
    if (trackers == null) {
      return {};
    }
    for (int i = 0; i < trackers!.length; i++) {
      trackersMap[i.toString()] = trackers![i];
    }

    return {
      'trackers': trackersMap,
    };
  }
}

class TrackersAll extends All {
  @RequestParameter(Necessity.optional, ['carrier'])
  String? carrier;

  @RequestParameter(Necessity.optional, ['tracking_code'])
  String? trackingCode;

  TrackersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

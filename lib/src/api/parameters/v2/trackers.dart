import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/parameters/_generic.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/models/tracker.dart';

@reflector
class TrackersCreate extends Create {
  @JsonParameter(Necessity.optional, ['tracker', 'amount'])
  String? amount;

  @JsonParameter(Necessity.optional, ['tracker', 'carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['options', 'carrier_account'])
  String? carrierAccount;

  @JsonParameter(Necessity.optional, ['options', 'full_test_tracker'])
  bool? fullTestTracker;

  @JsonParameter(Necessity.optional, ['options', 'is_return'])
  bool? isReturn;

  @JsonParameter(Necessity.optional, ['tracker', 'tracking_code'])
  String? trackingCode;

  TrackersCreate({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

@reflector
class TrackersCreateList extends Create {
  @JsonParameter(Necessity.optional, ['trackers'])
  List<Tracker>? trackers;

  TrackersCreateList({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);

  // TODO: This custom overload does not check for API compatibility.
  // TODO: Please, fix this hack in the API?
  @override
  Map<String, dynamic> constructJson({Client? client, ApiVersion? apiVersion}) {
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

@reflector
class TrackersAll extends All {
  @JsonParameter(Necessity.optional, ['carrier'])
  String? carrier;

  @JsonParameter(Necessity.optional, ['tracking_code'])
  String? trackingCode;

  TrackersAll({Map<String, dynamic>? overrideParameters})
      : super(overrideParameters: overrideParameters);
}

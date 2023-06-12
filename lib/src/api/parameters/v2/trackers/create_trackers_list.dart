import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/internal/parameter_annotation.dart';
import 'package:easypost/src/api/parameters/_base.dart';
import 'package:easypost/src/internal/reflection.dart';
import 'package:easypost/src/models/tracker.dart';

@reflector
class CreateTrackersList extends Parameters {
  @JsonParameter(Necessity.optional, ['trackers'])
  List<Tracker>? trackers;

  CreateTrackersList()
      : super();

  // TODO: This custom overload does not check for API compatibility.
  // TODO: Please, fix this hack in the API?
  @override
  Map<String, dynamic> constructJson({Client? client}) {
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
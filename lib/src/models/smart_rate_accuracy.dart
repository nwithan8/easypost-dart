

import 'package:easypost/src/models/time_in_transit.dart';

enum SmartRateAccuracy {
  percentile50,
  percentile75,
  percentile85,
  percentile90,
  percentile95,
  percentile97,
  percentile99,
}

extension SmartRateAccuracyExtension on SmartRateAccuracy {
  String get key {
    switch (this) {
      case SmartRateAccuracy.percentile50:
        return 'percentile_50';
      case SmartRateAccuracy.percentile75:
        return 'percentile_75';
      case SmartRateAccuracy.percentile85:
        return 'percentile_85';
      case SmartRateAccuracy.percentile90:
        return 'percentile_90';
      case SmartRateAccuracy.percentile95:
        return 'percentile_95';
      case SmartRateAccuracy.percentile97:
        return 'percentile_97';
      case SmartRateAccuracy.percentile99:
        return 'percentile_99';
    }
  }

  String asString() => key;
}

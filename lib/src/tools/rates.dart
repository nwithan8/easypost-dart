import 'package:easypost/src/constants.dart';
import 'package:easypost/src/exceptions/filtering_exception.dart';
import 'package:easypost/src/models/quoted_rate.dart';
import 'package:easypost/src/models/smart_rate.dart';
import 'package:easypost/src/enums/smart_rate_accuracy.dart';

QuotedRate getLowestRateInternal(List<QuotedRate> rates,
    {List<String>? includeCarriers,
    List<String>? excludeCarriers,
    List<String>? includeServices,
    List<String>? excludeServices}) {
  includeCarriers ??= [];
  excludeCarriers ??= [];
  includeServices ??= [];
  excludeServices ??= [];

  includeCarriers = includeCarriers.map((e) => e.toLowerCase()).toList();
  excludeCarriers = excludeCarriers.map((e) => e.toLowerCase()).toList();
  includeServices = includeServices.map((e) => e.toLowerCase()).toList();
  excludeServices = excludeServices.map((e) => e.toLowerCase()).toList();

  QuotedRate? lowestRate;

  for (final rate in rates) {
    if (rate.price == null) {
      continue; // Skip this rate if it doesn't have a price
    }

    if (lowestRate != null && lowestRate.price == null) {
      // somehow a rate with null got selected in the last iteration, throw an error
      // the guard clause above should have prevented this, so this should never happen
      throw FilteringException(
          'A rate with null price was selected in the last iteration');
    }

    // if the rate has a carrier
    if (rate.carrier != null) {
      // if the rate is not in the includeCarriers list, skip it
      if (includeCarriers.isNotEmpty &&
          !includeCarriers.contains(rate.carrier?.toLowerCase())) {
        continue;
      }

      // if the rate is in the excludeCarriers list, skip it
      if (excludeCarriers.isNotEmpty &&
          excludeCarriers.contains(rate.carrier?.toLowerCase())) {
        continue;
      }
    }

    // if the rate has a service
    if (rate.service != null) {
      // if the rate is not in the includeServices list, skip it
      if (includeServices.isNotEmpty &&
          !includeServices.contains(rate.service?.toLowerCase())) {
        continue;
      }

      // if the rate is in the excludeServices list, skip it
      if (excludeServices.isNotEmpty &&
          excludeServices.contains(rate.service?.toLowerCase())) {
        continue;
      }
    }

    // if there's no lowest rate yet, use it
    if (lowestRate == null) {
      lowestRate = rate;
      continue;
    }

    // if the rate is lower than the current lowest rate, use it
    if (rate.price! < lowestRate.price!) {
      lowestRate = rate;
      continue;
    }
  }

  if (lowestRate == null) {
    throw FilteringException(ErrorMessages.noMatchingRatesFound);
  }

  return lowestRate;
}

SmartRate getLowestSmartRate(List<SmartRate> smartRates, int deliveryDays,
    SmartRateAccuracy deliveryAccuracy) {
  SmartRate? lowestRate;

  for (SmartRate rate in smartRates) {
    if (rate.price == null) {
      continue; // Skip this rate if it doesn't have a price
    }

    if (lowestRate != null && lowestRate.price == null) {
      // somehow a rate with null got selected in the last iteration, throw an error
      // the guard clause above should have prevented this, so this should never happen
      throw FilteringException(
          'A smart rate with null price was selected in the last iteration');
    }

    if (rate.timeInTransit == null) {
      continue; // Skip this rate if it doesn't have a time in transit
    }

    int? estimatedDeliveryDays =
        rate.timeInTransit?.bySmartRateAccuracy(deliveryAccuracy);

    if (estimatedDeliveryDays == null) {
      continue; // Skip this rate if it doesn't have a time in transit for the given accuracy
    }

    if (estimatedDeliveryDays > deliveryDays) {
      continue; // Skip this rate if the estimated delivery days is greater than the given delivery days
    }

    // if there's no lowest rate yet, use it
    if (lowestRate == null) {
      lowestRate = rate;
      continue;
    }

    // if the rate is lower than the current lowest rate, use it
    if (rate.price! < lowestRate.price!) {
      lowestRate = rate;
      continue;
    }
  }

  if (lowestRate == null) {
    throw FilteringException(ErrorMessages.noMatchingRatesFound);
  }

  return lowestRate;
}

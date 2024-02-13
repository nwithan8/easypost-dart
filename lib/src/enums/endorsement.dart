import 'package:easypost/src/internal/enums.dart';

/// The available endorsements.
class Endorsement extends SerializableEnum {
  /// Address service requested
  static Endorsement addressServiceRequested =
      Endorsement(1, 'ADDRESS_SERVICE_REQUESTED');

  /// Forwarding service requested
  static Endorsement forwardingServiceRequested =
      Endorsement(2, 'FORWARDING_SERVICE_REQUESTED');

  /// Change service requested
  static Endorsement changeServiceRequested =
      Endorsement(3, 'CHANGE_SERVICE_REQUESTED');

  /// Return service requested
  static Endorsement returnServiceRequested =
      Endorsement(4, 'RETURN_SERVICE_REQUESTED');

  /// Leave if no response
  static Endorsement leaveIfNoResponse = Endorsement(5, 'LEAVE_IF_NO_RESPONSE');

  Endorsement(super.id, super.jsonValue);

  /// Get the [Endorsement] from a [String].
  static Endorsement? fromString(String? value) {
    switch (value) {
      case 'ADDRESS_SERVICE_REQUESTED':
        return addressServiceRequested;
      case 'FORWARDING_SERVICE_REQUESTED':
        return forwardingServiceRequested;
      case 'CHANGE_SERVICE_REQUESTED':
        return changeServiceRequested;
      case 'RETURN_SERVICE_REQUESTED':
        return returnServiceRequested;
      case 'LEAVE_IF_NO_RESPONSE':
        return leaveIfNoResponse;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [Endorsement].
  static String? asString(Endorsement? endorsement) => endorsement?.toString();
}

String? endorsementToJson(Endorsement? endorsement) =>
    Endorsement.asString(endorsement);

Endorsement? endorsementFromJson(String? value) => Endorsement.fromString(value);

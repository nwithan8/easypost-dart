import 'package:easypost/src/internal/enums.dart';

/// The available batch states.
class BatchState extends SerializableEnum {
  /// The batch is being created.
  static BatchState creating = BatchState('creating');

  /// Creation of the batch failed.
  static BatchState creationFailed = BatchState('creation_failed');

  /// The batch has been created.
  static BatchState created = BatchState('created');

  /// The batch is being purchased.
  static BatchState purchasing = BatchState('purchasing');

  /// Purchase of the batch failed.
  static BatchState purchaseFailed = BatchState('purchase_failed');

  /// The batch has been purchased.
  static BatchState purchased = BatchState('purchased');

  /// The label for the batch is being generated.
  static BatchState labelGenerating = BatchState('label_generating');

  /// The label for the batch has been generated.
  static BatchState labelGenerated = BatchState('label_generated');

  BatchState(super.jsonValue);

  /// Get the [BatchState] from a [String].
  static BatchState? fromString(String? value) {
    switch (value) {
      case 'creating':
        return creating;
      case 'creation_failed':
        return creationFailed;
      case 'created':
        return created;
      case 'purchasing':
        return purchasing;
      case 'purchase_failed':
        return purchaseFailed;
      case 'purchased':
        return purchased;
      case 'label_generating':
        return labelGenerating;
      case 'label_generated':
        return labelGenerated;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [BatchState].
  static String? asString(BatchState? batchState) => batchState.toString();
}

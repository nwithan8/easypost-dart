import 'package:easypost/src/internal/enums.dart';

/// The available payment log charge types.
class PaymentLogChargeType extends SerializableEnum {
  /// Payment log charge type for refund.
  static PaymentLogChargeType refund = PaymentLogChargeType(1, 'refund');

  /// Payment log charge type for insurance.
  static PaymentLogChargeType insurance = PaymentLogChargeType(2, 'insurance');

  /// Payment log charge type for manual debit.
  static PaymentLogChargeType manualDebit =
      PaymentLogChargeType(3, 'manual_debit');

  /// Payment log charge type for subscription.
  static PaymentLogChargeType subscription =
      PaymentLogChargeType(4, 'subscription');

  /// Payment log charge type for service fee.
  static PaymentLogChargeType serviceFee =
      PaymentLogChargeType(5, 'service_fee');

  /// Payment log charge type for recharge.
  static PaymentLogChargeType recharge = PaymentLogChargeType(6, 'recharge');

  /// Payment log charge type for fulfillment debit.
  static PaymentLogChargeType fulfillmentDebit =
      PaymentLogChargeType(7, 'fulfillment_debit');

  /// Payment log charge type for manual credit.
  static PaymentLogChargeType manualCredit =
      PaymentLogChargeType(8, 'manual_credit');

  /// Payment log charge type for payment failure deduction.
  static PaymentLogChargeType paymentFailureDeduction =
      PaymentLogChargeType(9, 'payment_failure_deduction');

  /// Payment log charge type for credit card fee.
  static PaymentLogChargeType creditCardFee =
      PaymentLogChargeType(10, 'credit_card_fee');

  /// Payment log charge type for payment refund.
  static PaymentLogChargeType paymentRefund =
      PaymentLogChargeType(11, 'payment_refund');

  /// Payment log charge type for partial refund.
  static PaymentLogChargeType partialRefund =
      PaymentLogChargeType(12, 'partial_refund');

  PaymentLogChargeType(super.id, super.jsonValue);

  /// Get the [PaymentLogChargeType] from a [String].
  static PaymentLogChargeType? fromString(String? value) {
    switch (value) {
      case 'refund':
        return refund;
      case 'insurance':
        return insurance;
      case 'manual_debit':
        return manualDebit;
      case 'subscription':
        return subscription;
      case 'service_fee':
        return serviceFee;
      case 'recharge':
        return recharge;
      case 'fulfillment_debit':
        return fulfillmentDebit;
      case 'manual_credit':
        return manualCredit;
      case 'payment_failure_deduction':
        return paymentFailureDeduction;
      case 'credit_card_fee':
        return creditCardFee;
      case 'payment_refund':
        return paymentRefund;
      case 'partial_refund':
        return partialRefund;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentLogChargeType].
  static String? asString(PaymentLogChargeType? paymentLogChargeType) =>
      paymentLogChargeType?.toString();
}

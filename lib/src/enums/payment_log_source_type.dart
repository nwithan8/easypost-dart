import 'package:easypost/src/internal/enums.dart';

/// The available payment log source types.
class PaymentLogSourceType extends SerializableEnum {
  /// Payment log source type for refund.
  static PaymentLogSourceType refund = PaymentLogSourceType(1, 'refund');

  /// Payment log source type for user.
  static PaymentLogSourceType user = PaymentLogSourceType(2, 'user');

  /// Payment log source type for manual debit.
  static PaymentLogSourceType manualDebit =
      PaymentLogSourceType(3, 'manual_debit');

  /// Payment log source type for bank account.
  static PaymentLogSourceType bankAccount =
      PaymentLogSourceType(4, 'bank_account');

  /// Payment log source type for ACH credit source.
  static PaymentLogSourceType achCreditSource =
      PaymentLogSourceType(5, 'ach_credit_source');

  /// Payment log source type for credit card.
  static PaymentLogSourceType creditCard =
      PaymentLogSourceType(6, 'credit_card');

  /// Payment log source type for insurance.
  static PaymentLogSourceType insurance = PaymentLogSourceType(7, 'insurance');

  /// Payment log source type for subscription.
  static PaymentLogSourceType subscription =
      PaymentLogSourceType(8, 'subscription');

  /// Payment log source type for fulfillment order.
  static PaymentLogSourceType fulfillmentOrder =
      PaymentLogSourceType(9, 'fulfillment_order');

  /// Payment log source type for payment refund.
  static PaymentLogSourceType paymentRefund =
      PaymentLogSourceType(10, 'payment_refund');

  /// Payment log source type for post-pay shipment.
  static PaymentLogSourceType postPayShipment =
      PaymentLogSourceType(11, 'post_pay_shipment');

  PaymentLogSourceType(super.id, super.jsonValue);

  /// Get the [PaymentLogSourceType] from a [String].
  static PaymentLogSourceType? fromString(String? value) {
    switch (value) {
      case 'refund':
        return refund;
      case 'user':
        return user;
      case 'manual_debit':
        return manualDebit;
      case 'bank_account':
        return bankAccount;
      case 'ach_credit_source':
        return achCreditSource;
      case 'credit_card':
        return creditCard;
      case 'insurance':
        return insurance;
      case 'subscription':
        return subscription;
      case 'fulfillment_order':
        return fulfillmentOrder;
      case 'payment_refund':
        return paymentRefund;
      case 'post_pay_shipment':
        return postPayShipment;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PaymentLogSourceType].
  static String? asString(PaymentLogSourceType? paymentLogSourceType) =>
      paymentLogSourceType?.toString();
}

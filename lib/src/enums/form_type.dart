import 'package:easypost/src/internal/enums.dart';

/// The available form types.
class FormType extends SerializableEnum {
  /// The CN22 form type.
  static FormType cn22 = FormType('cn22');

  /// The COD return label form type.
  static FormType codReturnLabel = FormType('cod_return_label');

  /// The commercial invoice form type.
  static FormType commercialInvoice = FormType('commercial_invoice');

  /// The high value report form type.
  static FormType highValueReport = FormType('high_value_report');

  /// The label QR code form type.
  static FormType labelQrCode = FormType('label_qr_code');

  /// The NAFTA certificate of origin form type.
  static FormType naftaCertificateOfOrigin =
      FormType('nafta_certificate_of_origin');

  /// The order summary form type.
  static FormType orderSummary = FormType('order_summary');

  /// The return packing slip form type.
  static FormType returnPackingSlip = FormType('return_packing_slip');

  /// The RMA QR code form type.
  static FormType rmaQrCode = FormType('rma_qr_code');

  FormType(super.jsonValue);

  /// Get the [FormType] from a [String].
  static FormType? fromString(String? value) {
    switch (value) {
      case 'cn22':
        return cn22;
      case 'cod_return_label':
        return codReturnLabel;
      case 'commercial_invoice':
        return commercialInvoice;
      case 'high_value_report':
        return highValueReport;
      case 'label_qr_code':
        return labelQrCode;
      case 'nafta_certificate_of_origin':
        return naftaCertificateOfOrigin;
      case 'order_summary':
        return orderSummary;
      case 'return_packing_slip':
        return returnPackingSlip;
      case 'rma_qr_code':
        return rmaQrCode;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [FormType].
  static String? asString(FormType? formType) => formType.toString();
}

import 'package:easypost/src/internal/enums.dart';

/// The available print custom code types.
class PrintCustomCode extends SerializableEnum {
  /// The purchase order number (FedEx, UPS).
  static PrintCustomCode purchaseOrderNumber = PrintCustomCode(1, "PO");

  /// The department number (FedEx, UPS).
  static PrintCustomCode departmentNumber = PrintCustomCode(2, "DP");

  /// The return merchandise authorization (FedEx).
  static PrintCustomCode fedexReturnMerchandiseAuthorization =
      PrintCustomCode(3, "RMA");

  /// The accounts receivable customer account (UPS).
  static PrintCustomCode upsAccountsReceivableCustomerAccount =
      PrintCustomCode(4, "AJ");

  /// The appropriation number (UPS).
  static PrintCustomCode upsAppropriationNumber = PrintCustomCode(5, "AT");

  /// The bill of lading number (UPS).
  static PrintCustomCode upsBillOfLadingNumber = PrintCustomCode(6, "BM");

  /// The collect on delivery number (UPS).
  static PrintCustomCode upsCollectOnDeliveryNumber = PrintCustomCode(7, "9V");

  /// The dealer order number (UPS).
  static PrintCustomCode upsDealerOrderNumber = PrintCustomCode(8, "ON");

  /// The FDA product code (UPS).
  static PrintCustomCode upsFdaProductCode = PrintCustomCode(9, "3Q");

  /// The invoice number (UPS).
  static PrintCustomCode upsInvoiceNumber = PrintCustomCode(10, "IK");

  /// The manifest key number (UPS).
  static PrintCustomCode upsManifestKeyNumber = PrintCustomCode(12, "MK");

  /// The model number (UPS).
  static PrintCustomCode upsModelNumber = PrintCustomCode(13, "MJ");

  /// The part number (UPS).
  static PrintCustomCode upsPartNumber = PrintCustomCode(14, "PM");

  /// The production code (UPS).
  static PrintCustomCode upsProductionCode = PrintCustomCode(15, "PC");

  /// The purchase request number (UPS).
  static PrintCustomCode upsPurchaseRequestNumber = PrintCustomCode(16, "RQ");

  /// The return merchandise authorization (UPS).
  static PrintCustomCode upsReturnMerchandiseAuthorization =
      PrintCustomCode(17, "RZ");

  /// The salesperson number (UPS).
  static PrintCustomCode upsSalespersonNumber = PrintCustomCode(18, "SA");

  /// The serial number (UPS).
  static PrintCustomCode upsSerialNumber = PrintCustomCode(19, "SE");

  /// The store number (UPS).
  static PrintCustomCode upsStoreNumber = PrintCustomCode(20, "ST");

  /// The transaction reference number (UPS).
  static PrintCustomCode upsTransactionReferenceNumber =
      PrintCustomCode(22, "TN");

  /// The employer's identification number (USPS).
  static PrintCustomCode uspsEmployerIdentificationNumber =
      PrintCustomCode(23, "EI");

  /// The federal tax ID (USPS).
  static PrintCustomCode uspsFederalTaxId = PrintCustomCode(24, "TJ");

  PrintCustomCode(super.id, super.jsonValue);

  /// Get the [PrintCustomCode] from a [String].
  static PrintCustomCode? fromString(String? value) {
    switch (value) {
      case "PO":
        return PrintCustomCode.purchaseOrderNumber;
      case "DP":
        return PrintCustomCode.departmentNumber;
      case "RMA":
        return PrintCustomCode.fedexReturnMerchandiseAuthorization;
      case "AJ":
        return PrintCustomCode.upsAccountsReceivableCustomerAccount;
      case "AT":
        return PrintCustomCode.upsAppropriationNumber;
      case "BM":
        return PrintCustomCode.upsBillOfLadingNumber;
      case "9V":
        return PrintCustomCode.upsCollectOnDeliveryNumber;
      case "ON":
        return PrintCustomCode.upsDealerOrderNumber;
      case "3Q":
        return PrintCustomCode.upsFdaProductCode;
      case "IK":
        return PrintCustomCode.upsInvoiceNumber;
      case "MK":
        return PrintCustomCode.upsManifestKeyNumber;
      case "MJ":
        return PrintCustomCode.upsModelNumber;
      case "PM":
        return PrintCustomCode.upsPartNumber;
      case "PC":
        return PrintCustomCode.upsProductionCode;
      case "RQ":
        return PrintCustomCode.upsPurchaseRequestNumber;
      case "RZ":
        return PrintCustomCode.upsReturnMerchandiseAuthorization;
      case "SA":
        return PrintCustomCode.upsSalespersonNumber;
      case "SE":
        return PrintCustomCode.upsSerialNumber;
      case "ST":
        return PrintCustomCode.upsStoreNumber;
      case "TN":
        return PrintCustomCode.upsTransactionReferenceNumber;
      case "EI":
        return PrintCustomCode.uspsEmployerIdentificationNumber;
      case "TJ":
        return PrintCustomCode.uspsFederalTaxId;
      default:
        return null;
    }
  }

  /// Get the [String] representation of a [PrintCustomCode].
  static String? asString(PrintCustomCode? printCustomCode) =>
      printCustomCode?.toString();
}

String? printCustomCodeToJson(PrintCustomCode? printCustomCode) =>
    PrintCustomCode.asString(printCustomCode);

PrintCustomCode? printCustomCodeFromJson(String? value) =>
    PrintCustomCode.fromString(value);

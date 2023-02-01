import 'package:json_annotation/json_annotation.dart';

part 'fixture_structures.g.dart';

@JsonSerializable(explicitToJson: true)
class FixtureStructures {
  @JsonKey(name: 'addresses')
  final Addresses addresses;
  @JsonKey(name: 'carrier_accounts')
  final CarrierAccounts carrierAccounts;
  @JsonKey(name: 'carrier_strings')
  final CarrierStrings carrierStrings;
  @JsonKey(name: 'credit_cards')
  final CreditCards creditCards;
  @JsonKey(name: 'customs_infos')
  final CustomsInfos customsInfos;
  @JsonKey(name: 'customs_items')
  final CustomsItems customsItems;
  @JsonKey(name: 'form_options')
  final FormOptions formOptions;
  @JsonKey(name: 'insurances')
  final Insurances insurances;
  @JsonKey(name: 'orders')
  final Orders orders;
  @JsonKey(name: 'page_sizes')
  final PageSizes pageSizes;
  @JsonKey(name: 'parcels')
  final Parcels parcels;
  @JsonKey(name: 'pickups')
  final Pickups pickups;
  @JsonKey(name: 'report_types')
  final ReportTypes reportTypes;
  @JsonKey(name: 'service_names')
  final ServiceNames serviceNames;
  @JsonKey(name: 'shipments')
  final Shipments shipments;
  @JsonKey(name: 'tax_identifiers')
  final TaxIdentifiers taxIdentifiers;
  @JsonKey(name: 'users')
  final Users users;
  @JsonKey(name: 'webhook_url')
  final String webhookUrl;

  FixtureStructures(
    this.addresses,
    this.carrierAccounts,
    this.carrierStrings,
    this.creditCards,
    this.customsInfos,
    this.customsItems,
    this.formOptions,
    this.insurances,
    this.orders,
    this.pageSizes,
    this.parcels,
    this.pickups,
    this.reportTypes,
    this.serviceNames,
    this.shipments,
    this.taxIdentifiers,
    this.users,
    this.webhookUrl,
  );

  factory FixtureStructures.fromJson(Map<String, dynamic> input) =>
      _$FixtureStructuresFromJson(input);

  Map<String, dynamic> toJson() => _$FixtureStructuresToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Addresses {
  @JsonKey(name: 'ca_address_1')
  final Map<String, dynamic> caAddress1;
  @JsonKey(name: 'ca_address_2')
  final Map<String, dynamic> caAddress2;
  @JsonKey(name: 'incorrect')
  final Map<String, dynamic> incorrectAddress;

  Addresses(
    this.caAddress1,
    this.caAddress2,
    this.incorrectAddress,
  );

  factory Addresses.fromJson(Map<String, dynamic> input) =>
      _$AddressesFromJson(input);

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CarrierAccounts {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  CarrierAccounts(
    this.basic,
  );

  factory CarrierAccounts.fromJson(Map<String, dynamic> input) =>
      _$CarrierAccountsFromJson(input);

  Map<String, dynamic> toJson() => _$CarrierAccountsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CarrierStrings {
  @JsonKey(name: 'usps')
  final String usps;

  CarrierStrings(
    this.usps,
  );

  factory CarrierStrings.fromJson(Map<String, dynamic> input) =>
      _$CarrierStringsFromJson(input);

  Map<String, dynamic> toJson() => _$CarrierStringsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreditCards {
  @JsonKey(name: 'test')
  final Map<String, dynamic> test;

  CreditCards(
    this.test,
  );

  factory CreditCards.fromJson(Map<String, dynamic> input) =>
      _$CreditCardsFromJson(input);

  Map<String, dynamic> toJson() => _$CreditCardsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CustomsInfos {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  CustomsInfos(
    this.basic,
  );

  factory CustomsInfos.fromJson(Map<String, dynamic> input) =>
      _$CustomsInfosFromJson(input);

  Map<String, dynamic> toJson() => _$CustomsInfosToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CustomsItems {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  CustomsItems(
    this.basic,
  );

  factory CustomsItems.fromJson(Map<String, dynamic> input) =>
      _$CustomsItemsFromJson(input);

  Map<String, dynamic> toJson() => _$CustomsItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FormOptions {
  @JsonKey(name: 'rma')
  final Map<String, dynamic> rma;

  FormOptions(
    this.rma,
  );

  factory FormOptions.fromJson(Map<String, dynamic> input) =>
      _$FormOptionsFromJson(input);

  Map<String, dynamic> toJson() => _$FormOptionsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Insurances {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  Insurances(
    this.basic,
  );

  factory Insurances.fromJson(Map<String, dynamic> input) =>
      _$InsurancesFromJson(input);

  Map<String, dynamic> toJson() => _$InsurancesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Orders {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  Orders(
    this.basic,
  );

  factory Orders.fromJson(Map<String, dynamic> input) =>
      _$OrdersFromJson(input);

  Map<String, dynamic> toJson() => _$OrdersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PageSizes {
  @JsonKey(name: 'fifty_results')
  final int fifty;
  @JsonKey(name: 'five_results')
  final int five;
  @JsonKey(name: 'one_result')
  final int one;
  @JsonKey(name: 'one_hundred_results')
  final int oneHundred;
  @JsonKey(name: 'ten_results')
  final int ten;
  @JsonKey(name: 'twenty_results')
  final int twenty;

  PageSizes(
    this.fifty,
    this.five,
    this.one,
    this.oneHundred,
    this.ten,
    this.twenty,
  );

  factory PageSizes.fromJson(Map<String, dynamic> input) =>
      _$PageSizesFromJson(input);

  Map<String, dynamic> toJson() => _$PageSizesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Parcels {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  Parcels(this.basic);

  factory Parcels.fromJson(Map<String, dynamic> input) =>
      _$ParcelsFromJson(input);

  Map<String, dynamic> toJson() => _$ParcelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Pickups {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  Pickups(this.basic);

  factory Pickups.fromJson(Map<String, dynamic> input) =>
      _$PickupsFromJson(input);

  Map<String, dynamic> toJson() => _$PickupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportTypes {
  @JsonKey(name: 'shipment')
  final String shipment;

  ReportTypes(this.shipment);

  factory ReportTypes.fromJson(Map<String, dynamic> input) =>
      _$ReportTypesFromJson(input);

  Map<String, dynamic> toJson() => _$ReportTypesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ServiceNames {
  @JsonKey(name: 'usps')
  final ServiceNamesUsps usps;

  ServiceNames(this.usps);

  factory ServiceNames.fromJson(Map<String, dynamic> input) =>
      _$ServiceNamesFromJson(input);

  Map<String, dynamic> toJson() => _$ServiceNamesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ServiceNamesUsps {
  @JsonKey(name: 'first_service')
  final String firstService;
  @JsonKey(name: 'pickup_service')
  final String pickupService;

  ServiceNamesUsps(this.firstService, this.pickupService);

  factory ServiceNamesUsps.fromJson(Map<String, dynamic> input) =>
      _$ServiceNamesUspsFromJson(input);

  Map<String, dynamic> toJson() => _$ServiceNamesUspsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Shipments {
  @JsonKey(name: 'basic_domestic')
  final Map<String, dynamic> basicDomestic;
  @JsonKey(name: 'full')
  final Map<String, dynamic> full;

  Shipments(this.basicDomestic, this.full);

  factory Shipments.fromJson(Map<String, dynamic> input) =>
      _$ShipmentsFromJson(input);

  Map<String, dynamic> toJson() => _$ShipmentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TaxIdentifiers {
  @JsonKey(name: 'basic')
  final Map<String, dynamic> basic;

  TaxIdentifiers(this.basic);

  factory TaxIdentifiers.fromJson(Map<String, dynamic> input) =>
      _$TaxIdentifiersFromJson(input);

  Map<String, dynamic> toJson() => _$TaxIdentifiersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Users {
  @JsonKey(name: 'referral')
  final Map<String, dynamic> referral;

  Users(this.referral);

  factory Users.fromJson(Map<String, dynamic> input) => _$UsersFromJson(input);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}

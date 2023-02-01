// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixture_structures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixtureStructures _$FixtureStructuresFromJson(Map<String, dynamic> json) =>
    FixtureStructures(
      Addresses.fromJson(json['addresses'] as Map<String, dynamic>),
      CarrierAccounts.fromJson(
          json['carrier_accounts'] as Map<String, dynamic>),
      CarrierStrings.fromJson(json['carrier_strings'] as Map<String, dynamic>),
      CreditCards.fromJson(json['credit_cards'] as Map<String, dynamic>),
      CustomsInfos.fromJson(json['customs_infos'] as Map<String, dynamic>),
      CustomsItems.fromJson(json['customs_items'] as Map<String, dynamic>),
      FormOptions.fromJson(json['form_options'] as Map<String, dynamic>),
      Insurances.fromJson(json['insurances'] as Map<String, dynamic>),
      Orders.fromJson(json['orders'] as Map<String, dynamic>),
      PageSizes.fromJson(json['page_sizes'] as Map<String, dynamic>),
      Parcels.fromJson(json['parcels'] as Map<String, dynamic>),
      Pickups.fromJson(json['pickups'] as Map<String, dynamic>),
      ReportTypes.fromJson(json['report_types'] as Map<String, dynamic>),
      ServiceNames.fromJson(json['service_names'] as Map<String, dynamic>),
      Shipments.fromJson(json['shipments'] as Map<String, dynamic>),
      TaxIdentifiers.fromJson(json['tax_identifiers'] as Map<String, dynamic>),
      Users.fromJson(json['users'] as Map<String, dynamic>),
      json['webhook_url'] as String,
    );

Map<String, dynamic> _$FixtureStructuresToJson(FixtureStructures instance) =>
    <String, dynamic>{
      'addresses': instance.addresses.toJson(),
      'carrier_accounts': instance.carrierAccounts.toJson(),
      'carrier_strings': instance.carrierStrings.toJson(),
      'credit_cards': instance.creditCards.toJson(),
      'customs_infos': instance.customsInfos.toJson(),
      'customs_items': instance.customsItems.toJson(),
      'form_options': instance.formOptions.toJson(),
      'insurances': instance.insurances.toJson(),
      'orders': instance.orders.toJson(),
      'page_sizes': instance.pageSizes.toJson(),
      'parcels': instance.parcels.toJson(),
      'pickups': instance.pickups.toJson(),
      'report_types': instance.reportTypes.toJson(),
      'service_names': instance.serviceNames.toJson(),
      'shipments': instance.shipments.toJson(),
      'tax_identifiers': instance.taxIdentifiers.toJson(),
      'users': instance.users.toJson(),
      'webhook_url': instance.webhookUrl,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      json['ca_address_1'] as Map<String, dynamic>,
      json['ca_address_2'] as Map<String, dynamic>,
      json['incorrect'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'ca_address_1': instance.caAddress1,
      'ca_address_2': instance.caAddress2,
      'incorrect': instance.incorrectAddress,
    };

CarrierAccounts _$CarrierAccountsFromJson(Map<String, dynamic> json) =>
    CarrierAccounts(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CarrierAccountsToJson(CarrierAccounts instance) =>
    <String, dynamic>{
      'basic': instance.basic,
    };

CarrierStrings _$CarrierStringsFromJson(Map<String, dynamic> json) =>
    CarrierStrings(
      json['usps'] as String,
    );

Map<String, dynamic> _$CarrierStringsToJson(CarrierStrings instance) =>
    <String, dynamic>{
      'usps': instance.usps,
    };

CreditCards _$CreditCardsFromJson(Map<String, dynamic> json) => CreditCards(
      json['test'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CreditCardsToJson(CreditCards instance) =>
    <String, dynamic>{
      'test': instance.test,
    };

CustomsInfos _$CustomsInfosFromJson(Map<String, dynamic> json) => CustomsInfos(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CustomsInfosToJson(CustomsInfos instance) =>
    <String, dynamic>{
      'basic': instance.basic,
    };

CustomsItems _$CustomsItemsFromJson(Map<String, dynamic> json) => CustomsItems(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CustomsItemsToJson(CustomsItems instance) =>
    <String, dynamic>{
      'basic': instance.basic,
    };

FormOptions _$FormOptionsFromJson(Map<String, dynamic> json) => FormOptions(
      json['rma'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$FormOptionsToJson(FormOptions instance) =>
    <String, dynamic>{
      'rma': instance.rma,
    };

Insurances _$InsurancesFromJson(Map<String, dynamic> json) => Insurances(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$InsurancesToJson(Insurances instance) =>
    <String, dynamic>{
      'basic': instance.basic,
    };

Orders _$OrdersFromJson(Map<String, dynamic> json) => Orders(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$OrdersToJson(Orders instance) => <String, dynamic>{
      'basic': instance.basic,
    };

PageSizes _$PageSizesFromJson(Map<String, dynamic> json) => PageSizes(
      json['fifty_results'] as int,
      json['five_results'] as int,
      json['one_result'] as int,
      json['one_hundred_results'] as int,
      json['ten_results'] as int,
      json['twenty_results'] as int,
    );

Map<String, dynamic> _$PageSizesToJson(PageSizes instance) => <String, dynamic>{
      'fifty_results': instance.fifty,
      'five_results': instance.five,
      'one_result': instance.one,
      'one_hundred_results': instance.oneHundred,
      'ten_results': instance.ten,
      'twenty_results': instance.twenty,
    };

Parcels _$ParcelsFromJson(Map<String, dynamic> json) => Parcels(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ParcelsToJson(Parcels instance) => <String, dynamic>{
      'basic': instance.basic,
    };

Pickups _$PickupsFromJson(Map<String, dynamic> json) => Pickups(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$PickupsToJson(Pickups instance) => <String, dynamic>{
      'basic': instance.basic,
    };

ReportTypes _$ReportTypesFromJson(Map<String, dynamic> json) => ReportTypes(
      json['shipment'] as String,
    );

Map<String, dynamic> _$ReportTypesToJson(ReportTypes instance) =>
    <String, dynamic>{
      'shipment': instance.shipment,
    };

ServiceNames _$ServiceNamesFromJson(Map<String, dynamic> json) => ServiceNames(
      ServiceNamesUsps.fromJson(json['usps'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ServiceNamesToJson(ServiceNames instance) =>
    <String, dynamic>{
      'usps': instance.usps.toJson(),
    };

ServiceNamesUsps _$ServiceNamesUspsFromJson(Map<String, dynamic> json) =>
    ServiceNamesUsps(
      json['first_service'] as String,
      json['pickup_service'] as String,
    );

Map<String, dynamic> _$ServiceNamesUspsToJson(ServiceNamesUsps instance) =>
    <String, dynamic>{
      'first_service': instance.firstService,
      'pickup_service': instance.pickupService,
    };

Shipments _$ShipmentsFromJson(Map<String, dynamic> json) => Shipments(
      json['basic_domestic'] as Map<String, dynamic>,
      json['full'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ShipmentsToJson(Shipments instance) => <String, dynamic>{
      'basic_domestic': instance.basicDomestic,
      'full': instance.full,
    };

TaxIdentifiers _$TaxIdentifiersFromJson(Map<String, dynamic> json) =>
    TaxIdentifiers(
      json['basic'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$TaxIdentifiersToJson(TaxIdentifiers instance) =>
    <String, dynamic>{
      'basic': instance.basic,
    };

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      json['referral'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'referral': instance.referral,
    };

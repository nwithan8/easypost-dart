import 'package:easypost/easypost.dart';

Future<void> example() async {
  // Set up the API client
  ClientConfiguration configuration = ClientConfiguration(
    "YOUR_API_KEY",
    apiVersion: ApiVersion.v2,
  );
  Client client = Client(configuration);

  // Create a to address
  AddressesCreate addressCreateParams = AddressesCreate();
  addressCreateParams.street1 = "388 Townsend St";
  addressCreateParams.city = "San Francisco";
  addressCreateParams.state = "CA";
  addressCreateParams.zip = "94107";
  addressCreateParams.country = "US";

  Address toAddress = await client.addresses.create(addressCreateParams);

  // Create a from address
  addressCreateParams = AddressesCreate();
  addressCreateParams.street1 = "388 Townsend St";
  addressCreateParams.city = "San Francisco";
  addressCreateParams.state = "CA";
  addressCreateParams.zip = "94107";
  addressCreateParams.country = "US";

  Address fromAddress = await client.addresses.create(addressCreateParams);

  // Create a parcel
  ParcelsCreate parcelsCreateParams = ParcelsCreate();
  parcelsCreateParams.length = 10.2;
  parcelsCreateParams.width = 7.8;
  parcelsCreateParams.height = 4.3;
  parcelsCreateParams.weight = 21.2;

  Parcel parcel = await client.parcels.create(parcelsCreateParams);

  // Create a shipment
  ShipmentsCreate shipmentsCreateParams = ShipmentsCreate();
  shipmentsCreateParams.toAddress = toAddress;
  shipmentsCreateParams.fromAddress = fromAddress;
  shipmentsCreateParams.parcel = parcel;

  Shipment shipment = await client.shipments.create(shipmentsCreateParams);

  // Get the lowest rate for the shipment
  Rate rate = client.shipments.getLowestRateFor(shipment);

  // Buy the shipment with the lowest rate
  ShipmentsBuy shipmentBuyParams = ShipmentsBuy();
  shipmentBuyParams.rate = rate;

  await client.shipments.buy(shipment, shipmentBuyParams);
}

# EasyPost Dart

This SDK allows you to interact with the [EasyPost API](https://www.easypost.com/docs/api) from your Dart application.

## Installation

Package is available on [pub.dev](https://pub.dev/packages/easypost).

## Usage

Full documentation is available on [Pub.dev](https://pub.dev/documentation/easypost/latest/) or [GitHub](https://nateharr.is/easypost-dart/)

### Example

```dart
import 'package:easypost/easypost.dart';

Future<void> example() async {
  // Set up the API client
  ClientConfiguration configuration = ClientConfiguration(
    "YOUR_API_KEY",
    apiVersion: ApiVersion.v2,
  );
  Client client = Client(configuration);
  
  // Create a to address
  CreateAddress addressCreateParams = CreateAddress();
  addressCreateParams.street1 = "388 Townsend St";
  addressCreateParams.city = "San Francisco";
  addressCreateParams.state = "CA";
  addressCreateParams.zip = "94107";
  addressCreateParams.country = "US";
  
  Address toAddress = await client.addresses.create(addressCreateParams);
  
  // Create a from address
  addressCreateParams = CreateAddress();
  addressCreateParams.street1 = "388 Townsend St";
  addressCreateParams.city = "San Francisco";
  addressCreateParams.state = "CA";
  addressCreateParams.zip = "94107";
  addressCreateParams.country = "US";
  
  Address fromAddress = await client.addresses.create(addressCreateParams);
  
  // Create a parcel
  CreateParcel parcelsCreateParams = CreateParcel();
  parcelsCreateParams.length = 10.2;
  parcelsCreateParams.width = 7.8;
  parcelsCreateParams.height = 4.3;
  parcelsCreateParams.weight = 21.2;
  
  Parcel parcel = await client.parcels.create(parcelsCreateParams);
  
  // Create a shipment
  CreateShipment shipmentsCreateParams = CreateShipment();
  shipmentsCreateParams.toAddress = toAddress;
  shipmentsCreateParams.fromAddress = fromAddress;
  shipmentsCreateParams.parcel = parcel;
  
  Shipment shipment = await client.shipments.create(shipmentsCreateParams);
  
  // Get the lowest rate for the shipment
  Rate rate = client.shipments.getLowestRateFor(shipment);
  
  // Buy the shipment with the lowest rate
  BuyShipment shipmentBuyParams = BuyShipment();
  shipmentBuyParams.rate = rate;
  
  Shipment purchasedShipment = await client.shipments.buy(shipment, shipmentBuyParams);
}
```

## Development

All messages are written with `json_serializable` so make sure to generate the
files with `dart run build_runner build` when you make changes and want to test
them.

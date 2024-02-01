import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/addresses/create_address.dart';
import 'package:easypost/src/api/parameters/v2/addresses/list_addresses.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/address.dart';

/// The [AddressService] handles addresses with the EasyPost API.
class AddressService extends Service {
  AddressService(Client client) : super(client);

  /// Creates an [Address].
  Future<Address> create(CreateAddress parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'addresses', ApiVersion.v2,
        parameters: parameterMap);
    return Address.fromJson(json);
  }

  /// Retrieves an [Address].
  Future<Address> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'addresses/$id', ApiVersion.v2);
    return Address.fromJson(json);
  }

  /// Lists all [Address]es.
  Future<AddressCollection> list({ListAddresses? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'addresses', ApiVersion.v2,
        parameters: parameterMap);
    final collection = AddressCollection.fromJson(json);
    collection.filters = parameters;

    return collection;
  }

  /// Verifies an [Address].
  Future<Address> verify(Address address) async {
    final json = await client.requestJson(
        HttpMethod.get, 'addresses/${address.id}/verify', ApiVersion.v2,
        rootElement: "address");
    return Address.fromJson(json);
  }

  /// Retrieves the next page of an [AddressCollection].
  Future<AddressCollection> getNextPage(AddressCollection collection,
      {int? pageSize}) {
    retrieveNextPageFunction(ListAddresses? parameters) {
      return list(parameters: parameters);
    }

    // Use user-provided pageSize if available, otherwise use the pageSize from the collection's filters, or default to null (server default).
    int? pageSize = collection.filters?.pageSize;

    return collection.getNextPage(
            retrieveNextPageFunction, collection.addresses, pageSize: pageSize)
        as Future<AddressCollection>;
  }
}

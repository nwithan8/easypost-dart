import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/http/parameters.dart';
import 'package:easypost/src/models/address.dart';

/// The [AddressService] handles addresses with the EasyPost API.
class AddressService extends Service {
  AddressService(Client client) : super(client);

  /// Creates an address.
  Future<Address> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'addresses', ApiVersion.v2,
        parameters: data.wrap(['address']));
    return Address.fromJson(json);
  }

  /// Retrieves an address.
  Future<Address> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'addresses/$id', ApiVersion.v2);
    return Address.fromJson(json);
  }

  /// Lists all addresses.
  Future<AddressCollection> list({Map<String, dynamic>? filters}) async {
    final json =
        await client.requestJson(HttpMethod.get, 'addresses', ApiVersion.v2, parameters: filters);
    return AddressCollection.fromJson(json);
  }

  /// Verifies an address.
  Future<Address> verify(Address address) async {
    final json = await client.requestJson(
        HttpMethod.get, 'addresses/${address.id}/verify', ApiVersion.v2,
        rootElement: "address");
    return Address.fromJson(json);
  }
}

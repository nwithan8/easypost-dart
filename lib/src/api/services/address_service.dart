import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/addresses.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/address.dart';

/// The [AddressService] handles addresses with the EasyPost API.
class AddressService extends Service {
  AddressService(Client client) : super(client);

  /// Creates an [Address].
  Future<Address> create(AddressesCreate parameters) async {
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
  Future<AddressCollection> list({AddressesAll? parameters}) async {
    Map<String, dynamic>? parameterMap =
        parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'addresses', ApiVersion.v2,
        parameters: parameterMap);
    return AddressCollection.fromJson(json);
  }

  /// Verifies an [Address].
  Future<Address> verify(Address address) async {
    final json = await client.requestJson(
        HttpMethod.get, 'addresses/${address.id}/verify', ApiVersion.v2,
        rootElement: "address");
    return Address.fromJson(json);
  }
}

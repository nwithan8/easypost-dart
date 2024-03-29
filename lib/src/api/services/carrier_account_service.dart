import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/api/parameters/v2/carrier_accounts/open_carrier_account.dart';
import 'package:easypost/src/api/parameters/v2/carrier_accounts/add_carrier_account.dart';
import 'package:easypost/src/api/parameters/v2/carrier_accounts/update_carrier_account.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/models/carrier_account.dart';

/// The [CarrierAccountService] handles carrier accounts with the EasyPost API.
class CarrierAccountService extends Service {
  CarrierAccountService(Client client) : super(client);

  /// Register a new carrier account.
  Future<CarrierAccount> register(OpenCarrierAccount parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'carrier_accounts/open', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  /// Creates a [CarrierAccount] record from an existing carrier account.
  Future<CarrierAccount> add(AddCarrierAccount parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    // String endpoint = parameters.endpoint;
    String endpoint = 'carrier_accounts';
    final json = await client.requestJson(
        HttpMethod.post, endpoint, ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  /// Retrieves a [CarrierAccount].
  Future<CarrierAccount> retrieve(String carrierAccountId) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts/$carrierAccountId', ApiVersion.v2);
    return CarrierAccount.fromJson(json);
  }

  /// Lists all [CarrierAccount]s.
  // This is not paginated.
  Future<List<CarrierAccount>> list() async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts', ApiVersion.v2);
    return json
        .map<CarrierAccount>((json) => CarrierAccount.fromJson(json))
        .toList();
  }

  /// Updates a [CarrierAccount].
  Future<CarrierAccount> update(
      String carrierAccountId, UpdateCarrierAccount parameters) async {
    Map<String, dynamic> parameterMap =
        parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.patch, 'carrier_accounts/$carrierAccountId', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  /// Deletes a [CarrierAccount].
  Future<bool> delete(String carrierAccountId) async {
    return await client.request(
        HttpMethod.delete, 'carrier_accounts/$carrierAccountId', ApiVersion.v2);
  }
}

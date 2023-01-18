import 'package:easypost/src/api/client.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/api/http/api_version.dart';
import 'package:easypost/src/api/http/http_method.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/api/parameters/carrier_accounts.dart';

/// The [CarrierAccountService] handles carrier accounts with the EasyPost API.
class CarrierAccountService extends Service {
  CarrierAccountService(Client client) : super(client);

  /// Creates a [CarrierAccount].
  Future<CarrierAccount> create(CarrierAccountsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.post, 'carrier_accounts', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  /// Retrieves a [CarrierAccount].
  Future<CarrierAccount> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts/$id', ApiVersion.v2);
    return CarrierAccount.fromJson(json);
  }

  /// Lists all [CarrierAccount]s.
  Future<List<CarrierAccount>> list({CarrierAccountsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.constructJson(client: client);
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts', ApiVersion.v2,
        parameters: parameterMap);
    return json
        .map<CarrierAccount>((json) => CarrierAccount.fromJson(json))
        .toList();
  }

  /// Updates a [CarrierAccount].
  Future<CarrierAccount> update(
      CarrierAccount carrierAccount, CarrierAccountsUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.constructJson(client: client);
    final json = await client.requestJson(HttpMethod.patch,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  /// Deletes a [CarrierAccount].
  Future<bool> delete(CarrierAccount carrierAccount) async {
    return await client.request(HttpMethod.delete,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2);
  }
}

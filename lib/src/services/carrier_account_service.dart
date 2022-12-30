import 'package:easypost/easypost.dart';
import 'package:easypost/src/base/service.dart';
import 'package:easypost/src/http/api_version.dart';
import 'package:easypost/src/http/http_method.dart';
import 'package:easypost/src/models/carrier_account.dart';
import 'package:easypost/src/parameters/carrier_accounts.dart';

class CarrierAccountService extends Service {
  CarrierAccountService(Client client) : super(client);

  Future<CarrierAccount> create(CarrierAccountsCreate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(
        HttpMethod.post, 'carrier_accounts', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  Future<CarrierAccount> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts/$id', ApiVersion.v2);
    return CarrierAccount.fromJson(json);
  }

  Future<List<CarrierAccount>> list({CarrierAccountsAll? parameters}) async {
    Map<String, dynamic>? parameterMap = parameters?.toMap(client);
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts', ApiVersion.v2,
        parameters: parameterMap);
    return json
        .map<CarrierAccount>((json) => CarrierAccount.fromJson(json))
        .toList();
  }

  Future<CarrierAccount> update(
      CarrierAccount carrierAccount, CarrierAccountsUpdate parameters) async {
    Map<String, dynamic> parameterMap = parameters.toMap(client);
    final json = await client.requestJson(HttpMethod.patch,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2,
        parameters: parameterMap);
    return CarrierAccount.fromJson(json);
  }

  Future<bool> delete(CarrierAccount carrierAccount) async {
    return await client.request(HttpMethod.delete,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2);
  }
}

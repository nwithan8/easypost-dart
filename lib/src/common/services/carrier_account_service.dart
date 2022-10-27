import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/http_method.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/address.dart';
import 'package:easypost/src/common/models/carrier_account.dart';

class CarrierAccountService extends Service {
  CarrierAccountService(Client client) : super(client);

  Future<CarrierAccount> create(Map<String, dynamic> data) async {
    final json = await client.requestJson(
        HttpMethod.post, 'carrier_accounts', ApiVersion.v2,
        parameters: data.wrap(['carrier_account']));
    return CarrierAccount.fromJson(json);
  }

  Future<CarrierAccount> retrieve(String id) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts/$id', ApiVersion.v2);
    return CarrierAccount.fromJson(json);
  }

  Future<List<CarrierAccount>> list({Map<String, dynamic>? filters}) async {
    final json = await client.requestJson(
        HttpMethod.get, 'carrier_accounts', ApiVersion.v2, parameters: filters);
    return json
        .map<CarrierAccount>((json) => CarrierAccount.fromJson(json))
        .toList();
  }

  Future<CarrierAccount> update(
      CarrierAccount carrierAccount, Map<String, dynamic> data) async {
    final json = await client.requestJson(HttpMethod.patch,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2,
        parameters: data.wrap(['carrier_account']));
    return CarrierAccount.fromJson(json);
  }

  Future<bool> delete(CarrierAccount carrierAccount) async {
    return await client.request(HttpMethod.delete,
        'carrier_accounts/${carrierAccount.id}', ApiVersion.v2);
  }
}

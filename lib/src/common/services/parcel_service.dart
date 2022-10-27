import 'package:easypost/easypost.dart';
import 'package:easypost/src/common/base/service.dart';
import 'package:easypost/src/common/http/api_version.dart';
import 'package:easypost/src/common/http/parameters.dart';
import 'package:easypost/src/common/models/parcel.dart';
import 'package:easypost/src/common/http/http_method.dart';

class ParcelService extends Service {
  ParcelService(Client client) : super(client);

  Future<Parcel> create(Map<String, dynamic> parameters) async {
    return await client.requestJson(
      HttpMethod.post,
      'parcels',
      ApiVersion.v2,
      parameters: parameters.wrap(['parcel']),
    );
  }

  Future<Parcel> retrieve(String id) async {
    return await client.requestJson(
      HttpMethod.get,
      'parcels/$id',
      ApiVersion.v2,
    );
  }
}
